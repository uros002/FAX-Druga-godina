using StatsModels
using GLM
using DataFrames
using CSV
using Lathe.preprocess: TrainTestSplit
using Plots
using Statistics

#1. priprema podataka
data = DataFrame(CSV.File("tacke40b.csv"))

c = cor(data.x,data.y)
println("Koeficijent korelacije je $c")
if c > 0.9
        println("Postoji veoma jaka veza izmedju podataka")
elseif c>0.7
        println("Postoji jaka veza izmedju podataka")
elseif c>0.5
        println("Postoji umerena veza izmedju podataka")
else
        println("Veza izmedju podataka nije dovoljno jaka")
end

#razbijanje podataka na train i test i prikaz njihovog odnosa na grafiku 
dataTrain, dataTest = TrainTestSplit(data,.80)
myInputPlot = scatter(dataTrain.x,dataTrain.y,title = "Tacke pre regresije", ylabel = "Y Values", xlabel = "X Values")
scatter!(myInputPlot,dataTest.x,dataTest.y)

# radjenje linearne regresije
fm = @formula(y ~ x)
linearRegression = lm(fm,dataTrain)
dataPredictedTrain = predict(linearRegression,dataTrain)
dataPredictedTest = predict(linearRegression,dataTest)

for i in 1:length(dataPredictedTest)
        println("(X$i, Y$i) = ($(dataTest.x[i]), $(dataTest.y[i]))  ->  Predicted: Y$i $(dataPredictedTest[i])")
end
myOutputPlot = scatter(dataTrain.x,dataTrain.y,title = "Tacke posle linearne regresije")
scatter!(myOutputPlot,dataTest.x,dataTest.y)
scatter!(myOutputPlot,dataTest.x,dataPredictedTest)
scatter!(myOutputPlot)

#3 analiza rezultata
println()

rSquared = r2(linearRegression)
println("Vrednost rSquared iznosi $rSquared")
if rSquared > 0.9
        println("Ovaj model je jako dobar za predvidjanje")
elseif rSquared > 0.7
        println("Ovaj model je veoma dobar za predvidjanje")
elseif rSquared > 0.5
        println("Ovaj model je relativno dobar za predvidjanje")
else 
        println("Ovaj model je los za predvidjanje")
end

#racunanje gresaka za skup za obuku 
println()
errorsTrain = dataTrain.y - dataPredictedTrain
println("Spisak svih gresaka pri obuci je $(round.(errorsTrain; digits = 3))")
#prosek greske
absMeanErrorTrain = mean(abs.(errorsTrain))
#prosecna relativna greska u procentima MAPE
mapeTrain = mean(abs.(errorsTrain/dataTrain.y))
#kvadrat greske 
errorsTrainSquared = errorsTrain.*errorsTrain
#racunanje mse i rmse
mseTrain = mean(errorsTrainSquared)
rmseTrain = sqrt(mean(errorsTrainSquared))

println("Prosecna apsolutna greska pri obuci je: $absMeanErrorTrain")
println("Prosecna relativna greska pri obuci je: $mapeTrain")
println("Prosek kavdrata greske pri obuci je: $errorsTrainSquared")
println("Koren proseka kvadrata greske pri obuci je: $rmseTrain")

#Racunanje gresaka za test skup 
println()
errorsTest = dataTest.y - dataPredictedTest
println("Spisak svih gresaka pri obuci je $(round.(errorsTest; digits = 3))")
#prosek greske
absMeanErrorTest = mean(abs.(errorsTest))
#prosecna relativna greska 
mapeTest = mean(abs.(errorsTest/dataTest.y))
#kvadrat greske 
errorsTestSquared = errorsTest.*errorsTest
#mse i rmse
mseTest = mean(errorsTestSquared)
rmseTest = sqrt(mean(errorsTestSquared))

println("Prosecna apsolutna greska pri obuci je: $absMeanErrorTest")
println("Prosecna relativna greska pri obuci je: $mapeTest")
println("Prosek kavdrata greske pri obuci je: $errorsTestSquared")
println("Koren proseka kvadrata greske pri obuci je: $rmseTest")

if rmseTest < rmseTrain
        println("Sistem nije dobro istreniran")
else
        println("Sistem je dobro istreniran")
end


