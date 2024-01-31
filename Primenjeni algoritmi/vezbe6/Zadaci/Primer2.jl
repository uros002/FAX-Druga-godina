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
# Ucitavanje podataka za 1000 pacijenata
data = DataFrame(CSV.File("pacijenti1000a.csv"))
      
# Podela na skup za obuku i testiranja
dataTrain, dataTest = TrainTestSplit(data,.80)

# 2. Logisticka regresija
# Priprema za logisticku regresiju sa skupom za obuku
fm = @formula(bolest ~ visina + tezina + dbp + sbp)
logisticRegressor = glm(fm, dataTrain, Binomial(), ProbitLink()) 
# Testranje podataka logistickom regresijom
dataPredictedTest = predict(logisticRegressor, dataTest)

# Racunanje matrice
dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))
for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] <0.5)
        dataPredictedTestClass[i] = 0
    else
        dataPredictedTestClass[i] = 1
    end
end

brojObolelihOdDijabetesaPredict = sum(dataPredictedTestClass)
brojZdravihPredict = length(dataPredictedTestClass)-brojObolelihOdDijabetesaPredict

brojObolelihOdDijabetesa = sum(dataTest.bolest)
brojZdravih = length(dataTest.bolest) - brojObolelihOdDijabetesa

println("Predevidjen broj osoba imaju dijabetes je: $brojObolelihOdDijabetesaPredict")
println("Broj osoba imaju dijabetes je: $brojObolelihOdDijabetesa")

println("Predvidjen broj osoba koji nemaju dijabetes  je: $brojZdravihPredict")
println("Broj osoba koji nemaju dijabetes  je: $brojZdravih")