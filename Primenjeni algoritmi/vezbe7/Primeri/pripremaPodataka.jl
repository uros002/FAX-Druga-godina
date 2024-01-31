# Pkg
using Statistics
using StatsModels
using StatsBase
using GLM
using DataFrames
using CSV
using Lathe
using Plots, StatsPlots

plotlyjs()
df = DataFrame(CSV.File("motor_cena.csv"))
display(describe(df))
display(countmap(df[!,:Boja]))
display(countmap(df[!,:Stanje]))
display(countmap(df[!,:Tip]))
display(countmap(df[!,:Ostecenje]))

dropmissing!(df, [:Cena])
filter!(row -> row.Cena != 0, df)

select!(df,Not(:Boja))

df[ismissing.(df[!,:Stanje]), :Stanje] .= mode(skipmissing(df[!,:Stanje]))
df[ismissing.(df[!,:Ostecenje]), :Ostecenje] .= mode(skipmissing(df[!,:Ostecenje]))
df[ismissing.(df[!,:Kilometraza]), :Kilometraza] .= trunc(Int64,mean(skipmissing(df[!,:Kilometraza])))

display(describe(df))

plotgod = scatter(df.Godiste, df.Cena, title = "Scatter za godiste cena", ylabel = "Cena", xlabel = "Godiste", legend = true)
display(plotgod)

plotkilometraza = scatter(df.Kilometraza, df.Cena, title = "Scatter za kilometraza cena", ylabel = "Cena", xlabel = "Kilometraza", legend = true)
display(plotkilometraza)

plotkubikaza = scatter(df.Kubikaza, df.Cena, title = "Scatter za kubikaza cena", ylabel = "Cena", xlabel = "Kubikaza", legend = true)
display(plotkubikaza)

plotkw = scatter(df.kW, df.Cena, title = "Scatter za kw cena", ylabel = "Cena", xlabel = "kw", legend = true)
display(plotkw)

plotks = scatter(df.KS, df.Cena, title = "Scatter za ks cena", ylabel = "Cena", xlabel = "KS", legend = true)
display(plotks)

plotcilindri = scatter(df.BrojCilindara, df.Cena, title = "Scatter za broj cilindara cena", ylabel = "Cena", xlabel = "Broj cilindara", legend = true)
display(plotcilindri)


filter!(row -> row.Godiste > 1900 && row.Godiste <= 2022,df)
filter!(row -> row.Kilometraza < 500000,df)
filter!(row -> row.BrojCilindara > 0 && row.BrojCilindara <= 300,df)

display(describe(df))

covkwks = cov(df.kW,df.KS)

if covkwks > 0.6
        select!(df,Not(:kW))
end

fm = @formula(Cena ~ Stanje + Tip + Godiste + Kilometraza + Kubikaza + KS + BrojCilindara + Ostecenje)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(df,.80)
regressionModel = lm(fm,dfTrain)

predictedTrain = predict(regressionModel,dfTrain)
predictedTest = predict(regressionModel,dfTest)

errorsTrain = dfTrain.Cena - predictedTrain
errorsTest = dfTest.Cena - predictedTest

absMeanErrorsTest = mean(abs.(errorsTest))
mapeTest = mean(abs.(errorsTest ./ dfTest.Cena))
errorsTestSquared = errorsTest .* errorsTest
mseTest = mean(errorsTestSquared)
rmseTest = sqrt(mseTest)

mseTrain = mean(errorsTrain .* errorsTrain)
rmseTrain = sqrt(mseTrain)

if rmseTrain > rmseTest 
        println("Sistem nije dobro istreniran")
else
        println("Sistem je dobro istreniran")
end

rSquared = r2(regressionModel)
if rSquared > 0.5
        println("Model je dovoljno dobar za predvidjanje")
end


