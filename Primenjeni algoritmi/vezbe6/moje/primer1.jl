
#PRVI PRIMER LOGICKE REGRESIJE

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

# 1. Priprema i provera podataka
# Ucitavanje podataka za 1000 tacaka
data = DataFrame(CSV.File("tacke1000a.csv"))

# Podela na skup za obuku i testiranja
dataTrain, dataTest = TraintTestSplit(data,.80)
myInputPlot = scatter(dataTrain.x,dataTrain.y, title = "Tacke pre logisticke regresije",ylabel = "Y values", xlabel = "X value")
scatter!(myInputPlot,dataTest.x,dataTest.y)

# 2. Logicka regresija
# Piprema za logisticku regresiju sa skupom za obuku 
fm = @formula(boja ~ x+y)
logisticRegressor = glm(fm,dataTrain, Binomial(), ProbitLink())
#Testiranje podataka logistickom regresijom
dataPredictedTest = predict(logisticRegressor,dataTest)
println("Predvidjeni podaci: $(round.(dataPredictedTest; digits = 2))")

#Racunanje matrice
dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))
for i in 1: length(dataPredictedTestClass)
        if ( dataPredictedTest[i] < 0.5)
                dataPredictedTestClass[i] = 0
        else
                dataPredictedTestClass = 1
        end
end
println("Predvidjene boje: $dataPredictedTestClass")
println("Boje: $(dataTest.boja)")

FPTest = 0 #False positives
FNTest = 0 #False negatives
TPTest = 0 #True positives
TNTest = 0 #True negatives

for i in 1:length(dataPredictedTestClass)
        if dataTest.boja[i] == 0 && dataPredictedTestClass[i] == 0
               global TNTest += 1
        elseif dataTest.boja[i] == 0 && dataPredictedTestClass[i] == 1
                global FPTest += 1
        elseif dataTest.boja[i] == 1 && dataPredictedTestClass[i] == 0
                global FNTest += 1
        elseif dataTest.boja[i] == 1 && dataPredictedTestClass[i] == 1
                global TPTest += 1
        end
end

#Umesto gornje petlje moze se koristiti i :
#confusion_matrix = MLBase.roc(dataTest.boja,dataPredictedTestClass)


#accuracy (preciznost) = (TP + TN)/(TP + TN + FP + FN) = (TP + TN)/(P + N)
accuracyTest = (TPTest + TNTest)/(TPTest +  TNTest + FPTest + FNTest)

#sensitivity (osetiljivost => True positive rates) = TP/(TP + FN) = TP/P
sensitivityTest = TPTest/(TPTest + FPTest)

#specificity (specificnost => True negative rates) = TN/(TN + FN) = TN/N
specificityTest = TNTest/(TNTest + FNTest)

println("TP = $TPTest, FP = $FPTest, TN = $TNTest, FN = $FNTest")
println("Accuracy za test skup je $accuracyTest")
println("Sensitivity za test skup je $sensitivityTest")
println("Sepcificity za test skup je $specificityTest")

rocTest = Roc.roc(dataPredictedTest, dataTest.boja, true)
aucTest = AUC(rocTest)
println("Povrsina ispod krive u procentima je: $aucTest")

if (aucTest > 0.9)
        println("Klasifikator je jako dobar")
elseif (aucTest > 0.8)
        println("Klasifikator je veoma dobar")
elseif (aucTest > 0.7)
        println("Klasifikator je dosta dobar")
elseif (aucTest > 0.5)
        println("Klasifikator je relativno dobar")
else 
        println("Klasifikator je los")
end

plot(rocTest,label = "ROC curve")