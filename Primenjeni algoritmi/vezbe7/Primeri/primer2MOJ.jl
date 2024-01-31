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
display(countmap(df[!, :Boja]))
display(countmap(df[!, :Stanje]))
display(countmap(df[!, :Tip]))
display(countmap(df[!, :Ostecenje]))

dropmissing!(df, [:Cena])
filter!(row -> row.Cena != 0, df)
select!(df, Not(:Boja))

df[ismissing.(df[!, :Stanje]), :Stanje] .= mode(skipmissing(df[!, :Stanje]))

df[ismissing.(df[!, :Ostecenje]), :Ostecenje] .= mode(skipmissing(df[!, :Ostecenje]))

df[ismissing.(df[!, :Kilometraza]), :Kilometraza] .= trunc(Int64, mean(skipmissing(df[!, :Kilometraza])))

display(describe(df))

plotgod = scatter(df.Godiste, df.Cena, title="Scatter godiste cena", ylabel="Cena", xlabel="godiste")
display(plotgod)
savefig(plotgod, "godistescatter.html")

plotcil = scatter(df.BrojCilindara, df.Cena, title="Scatter cilindri cena", ylabel="Cena", xlabel="cilindri")
display(plotcil)
savefig(plotcil, "brojCilindarascatter.html")

plotks = scatter(df.KS, df.Cena, title="Scatter KS cena", ylabel="Cena", xlabel="KS")
display(plotks)
savefig(plotks, "ksscatter.html")

plotkw = scatter(df.kW, df.Cena, title="Scatter KW cena", ylabel="Cena", xlabel="KW")
display(plotkw)
savefig(plotkw, "kwscatter.html")

plotkm = scatter(df.Kilometraza, df.Cena, title="Scatter KM cena", ylabel="Cena", xlabel="KM")
display(plotkm)
savefig(plotkm, "kilometrazascatter.html")


filter!(row -> row.Godiste > 1900 && row.Godiste <= 2022, df)

filter!(row -> row.BrojCilindara < 300, df)

filter!(row -> row.Kilometraza < 500000, df)

covkwks = cov(df.kW, df.KS)

if (covkwks > 0.6)
        select!(df, Not(:kW))
end

display(describe(df))

fm = @formula(Cena ~ Stanje + Tip + Godiste + Kilometraza + Kubikaza + KS + BrojCilindara + Ostecenje)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(df, 0.80)
regressionModel = lm(fm, dfTrain)

predictedTrain = predict(regressionModel, dfTrain)
predictedTest = predict(regressionModel, dfTest)

errorsTrain = dfTrain.Cena - predictedTrain
errorsTest = dfTest.Cena - predictedTest

absErrorTest = mean(abs.(errorsTest))
mapeTest = mean(abs.(errorsTest./dfTest.Cena))
mse = mean(errorsTest.*errorsTest)

rmseTrain = sqrt(mean(errorsTrain .* errorsTrain))
rmseTest = sqrt(mean(errorsTest .* errorsTest))

println("RMSE trening skupa je $rmseTrain, a RMSE test skupa je $rmseTest")
if (rmseTrain > rmseTest)
        println("Sistem nije dobro istrenirano")
else
        println("Sistem je dobro istrenirano")
end

rSquared = r2(regressionModel)
println("R2 je $rSquared")
if (rSquared > 0.5)
        println("Imamo dovoljno dobar model za predvidjanje")
end