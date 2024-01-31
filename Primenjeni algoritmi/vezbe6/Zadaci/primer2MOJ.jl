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

data = DataFrame(CSV.File("pacijenti1000a.csv"))

dataTrain, dataTest = TrainTestSplit(data,.80)
#myInputPlot = scatter(dataTrain.visina,dataTrain.tezina,title = "Tacke pre regresije", ylabel = "Y Values", xlabel = "X Values")
#scatter!(myInputPlot,dataTest.visina,dataTest.tezina)
fm = @formula(bolest ~ visina+tezina+dbp+sbp)
logisticRegression = glm(fm,dataTrain, Binomial(), ProbitLink())
dataPredictedTest = predict(logisticRegression, dataTest)

dataPredictedTestClass = repeat(0:0,length(dataPredictedTest))
for i in 1:length(dataPredictedTestClass)
        if dataPredictedTest[i] < 0.5
                dataPredictedTestClass[i] = 0;
        else
                dataPredictedTestClass[i] = 1;
        end
end

brojObolelihOdDijabetesaPredict = sum(dataPredictedTestClass)
brojZdravihPredict = length(dataPredictedTestClass) - brojObolelihOdDijabetesaPredict

brojObolelihOdDijabetesa = sum(dataTest.bolest)
brojZdravih = length(dataTest.bolest) - brojObolelihOdDijabetesa

println("Predvidjen broj obolelih od dijabetesa je: $brojObolelihOdDijabetesaPredict")
println("Broj obolelih od dijabetesa je: $brojObolelihOdDijabetesa")

println("Predvidjen broj zdravih je: $brojZdravihPredict")
println("Broj zdravih je: $brojZdravih")



