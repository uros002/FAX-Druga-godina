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

display(countmap(df[!,:Gender]))
df[ismissing.(df[!,:Gender]), :Gender] .= mode(skipmissing(df[!,:Gender]))

display(countmap(df[!,:Married]))
df[ismissing.(df[!,:Married]), :Married] .= mode(skipmissing(df[!,:Married]))

display(countmap(df[!,:Dependents]))
df[ismissing.(df[!,:Dependents]), :Dependents] .= mode(skipmissing(df[!,:Dependents]))

display(countmap(df[!,:Self_Employed]))
df[ismissing.(df[!,:Self_Employed]), :Self_Employed] .= mode(skipmissing(df[!,:Self_Employed]))

display(countmap(df[!,:LoanAmount]))
df[ismissing.(df[!,:LoanAmount]), :LoanAmount] .= trunc(Int64,mean(skipmissing(df[!,:LoanAmount])))

display(countmap(df[!,:Loan_Amount_Term]))
df[ismissing.(df[!,:Loan_Amount_Term]), :Loan_Amount_Term] .= trunc(Int64,mean(skipmissing(df[!,:Loan_Amount_Term])))

display(countmap(df[!,:Credit_History]))
df[ismissing.(df[!,:Credit_History]), :Credit_History] .= trunc(Int64,mean(skipmissing(df[!,:Credit_History])))

display(describe(df))



fm = @formula(Loan_Status ~  Gender + Married + Dependents + Education + Self_Employed + ApplicantIncome + CoapplicantIncome + LoanAmount + Loan_Amount_Term + Credit_History + Property_Area)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(df,.80)
regressionModel = glm(fm,dfTrain,Binomial(), ProbitLink())

predictedTest = predict(regressionModel,dfTest)

predictedTestClass = repeat(0:0,length(predictedTest))

for i in 1:length(predictedTestClass)
        if predictedTest[i] < 0.5
                predictedTestClass[i] = 0
        else
                predictedTestClass[i] = 1
        end
end

TPTest = 0
TNTest = 0
FPTest = 0
FNTest = 0

for i in 1:length(predictedTestClass)
        if dfTest.Loan_Status[i] == 0 && predictedTestClass[i] == 0
               global TNTest += 1
        elseif dfTest.Loan_Status[i] == 1 && predictedTestClass[i] == 1
               global TPTest += 1
        elseif dfTest.Loan_Status[i] == 0 && predictedTestClass[i] == 1
               global FPTest += 1
        elseif dfTest.Loan_Status[i] == 1 && predictedTestClass[i] == 0
               global FNTest += 1
        end
end

accuracy = (TPTest + TNTest) / (TPTest +TNTest +FPTest +FNTest)
sensitivity = (TPTest) / (TPTest + FNTest)
specificity = TNTest / (TNTest + FPTest)

println("accuracy = $accuracy")
println("sensitivity = $sensitivity")
println("specificity = $specificity")

rocTest = ROC.roc(predictedTest, dfTest.Loan_Status, true)
aucTest = AUC(rocTest)

if aucTest > 0.9
        println("Klasifikator je jako dobar")
elseif aucTest > 0.8
        println("Klasifikator je veoma dobar")
elseif aucTest > 0.7
        println("Klasifikator je dosta dobar")
elseif aucTest > 0.5
        println("Klasifikator je solidno dobar")
else
        println("Klasifikator je los")
end





Scanner in = new Scanner(System.in)