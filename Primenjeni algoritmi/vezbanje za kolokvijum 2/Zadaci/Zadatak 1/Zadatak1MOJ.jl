using DataFrames
using CSV
using StatsBase
using StatsModels
using Statistics
using Plots, StatsPlots
using ROC
using GLM
using Lathe

df = DataFrame(CSV.File("krediti.csv"))
display(describe(df))

display(countmap(df[!, :Gender]))
df[ismissing.(df[!, :Gender]), :Gender] .= mode(skipmissing(df[!,:Gender]))


display(countmap(df[!, :Married]))
df[ismissing.(df[!, :Married]), :Married] .= mode(skipmissing(df[!, :Gender]))

display(countmap(df[!, :Dependents]))
df[ismissing.(df[!, :Dependents]),:Dependents] .=mode(skipmissing(df[!,:Dependents]))

display(countmap(df[!, :Self_Employed]))
df[ismissing.(df[!, :Self_Employed]),:Self_Employed] .=mode(skipmissing(df[!,:Self_Employed]))

df(ismissing.(df[!, :LoanAmount]), :LoanAmount) .= trunc(Int64,mean(skipmissing(df[!,:LoanAmount])))

df[ismissing.(df[!, :Loan_Amount_Term]),:Loan_Amount_Term] .= trunc(Int64,mean(skipmissing(df[!,:Loan_Amount_Term])))

df[ismissing.(df[!, :Credit_History]), :Credit_History] .= mode(skipmissing(df[!, :Credit_History]))

display(describe(df))

fm = @formula(Loan_Status ~ Gender+Married+Dependents+Education+Self_Employed+ApplicantIncome+CoapplicantIncome+LoanAmount+Loan_Amount_Term+Credit_History+Property_Area)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(df, .80)
logisticRegressor = glm(fm,dfTrain, Binomial(), ProbitLink())
dataPredictTest = predict(logisticRegressor, dfTest)

dataPredictTestClass = repeat(0:0, length(dataPredictTest))

for i in 1:length(dataPredictTestClass)
        if(dataPredictTest[i] < 0.5)
                dataPredictTestClass[i] = 0
        else
                dataPredictTestClass[i] = 1
end

FPTest = 0
TPTest = 0
FNTest = 0
TNTest = 0

for i in 1:length(dataPredictTestClass)
        if dfTest.Loan_Status[i] == 0 && dataPredictTestClass == 0
                global TNTest += 1
        elseif dfTest.Loan_Status[i] == 1 && dataPredictTestClass == 1
                global TPTest += 1
        elseif dfTest.Loan_Status[i] == 0 && dataPredictTestClass == 1
                global FPTest += 1
        elseif dfTest.Loan_Status[i] == 1 && dataPredictTestClass == 0
                FNTest += 1
        end
end

accuracy = (TNTest + TPTest) / (TNTest + TPTest + FNTest + FPTest)
sensitivity = (TPTest) / (TPTest + FNTest)
specificity = TNTest / (TNTest + FPTest)

println("accuracy : $accuracy")
println("sensitivity : $sensitivity")
println("specificity : $specificity")

rocTest = ROC.roc(dataPredictTest, dfTest.Loan_Status, true)
aucTest = AUC(rocTest)

if aucTest > 0.9
        println("Klasifikator je jako dobar")
elseif aucTest > 0.8
        println("Klasifikator je veoma dobar")
elseif aucTest > 0.7
        println("Klasifikator je dosta dobar")
elseif aucTest > 0.5
        println("Klasifikator je relativno dobar")
else
        println("Klasifikator je los")
end