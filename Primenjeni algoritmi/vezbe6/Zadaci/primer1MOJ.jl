using StatsModels
using GLM
using DataFrames
using CSV
using Lathe.preprocess: TrainTestSplit
using Plots
using Statistics
using StatsBase
using MLBase
using ROC

#1. priprema i provera podataka i ucitavanje 
data = DataFrame(CSV.File("tacke1000a.csv"))

# Podela na train i test
dataTrain, dataTest = TrainTestSplit(data,.80)
myInputPlot = scatter(dataTrain.x,dataTrain.y,title = "Tacke pre logicke regresije", ylabel = "Y Values", xlabel = "X Values")
scatter!(myInputPlot,dataTest.x,dataTest.y)

#2. logicka regresija 
# priprema za logicku regresiju sa skupom za obuku 
fm = @formula(boja ~ x+y)
logisticRegression = glm(fm,dataTrain,Binomial(), ProbitLink())
#Testiranje podata logickom regresijom
dataPredictedTest = predict(logisticRegression, dataTest)
println("Predvidjeni podaci: $(round.(dataPredictedTest; digits = 2))")

#racunanje matrice
dataPredictedTestClass = repeat(0:0,length(dataPredictedTest))
for i in 1:length(dataPredictedTestClass)
        if(dataPredictedTest[i] < 0.5)
                dataPredictedTestClass[i] = 0;
        else
                dataPredictedTestClass[i] = 1;
        end
end
println("Predvidjene boje: $dataPredictedTestClass")
println("Boje: $(dataTest.boja)")

TP = 0
FP = 0
TN = 0
FN = 0

for i in 1:length(dataPredictedTestClass)
        if(dataPredictedTestClass[i] == 0 && dataTest.boja[i] == 0)
                global TN += 1
        elseif dataPredictedTestClass[i] == 1 && dataTest.boja[i] == 1
                global TP += 1
        elseif dataPredictedTestClass[i] == 1 && dataTest.boja[i] == 0
                global FP += 1
        elseif dataPredictedTestClass[i] == 0 && dataTest.boja[i] == 1
                global FN +=1
        end
end

accuracy = (TP + TN) / (TP + FP + TN + FN)
sensitivity = TP / (TP + FN)
specificity = TN / (TN + FP)

println("TP = $TP , TN = $TN, FP = $FP, FN = $FN")
println("accuracy za test skup je $accuracy")
println("sensitivity za test skup je $sensitivity")
println("specificity za test skup je $specificity")

rocTest = ROC.roc(dataPredictedTest,dataTest.boja, true)
aucTest = AUC(rocTest)
println("Povrsina ispod krive u procentima je: $aucTest")

if(aucTest > 0.9)
        println("Klasifikator je jako dobar")
elseif aucTest > 0.8
        println("Klasifikator je veoma dobar")
elseif aucTest > 0.7
        println("Klasifikator je dosta dobar")
elseif aucTest >0.5
        println("Klasifikator je solidno dobar")
else
        println("Klasifikator je los")
end

plot(rocTest, label = "ROC curve")

