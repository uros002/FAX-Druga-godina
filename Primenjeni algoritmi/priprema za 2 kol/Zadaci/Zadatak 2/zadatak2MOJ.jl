using DataFrames
using CSV
using StatsBase
using StatsModels
using Statistics
using Plots, StatsPlots
using ROC
using GLM
using Lathe

plotlyjs()
df = DataFrame(CSV.File("riba.csv"))
display(describe(df))

display(countmap(df[!,:Vrsta]))
display(countmap(df[!,:Duzina]))
display(countmap(df[!,:Cena]))

select!(df,Not(:Cena))

df[ismissing.(df[!,:Vrsta]), :Vrsta] .= mode(skipmissing(df[!,:Vrsta]))
df[ismissing.(df[!,:Duzina]), :Duzina] .= mean(skipmissing(df[!,:Duzina]))

display(describe(df))

plot = scatter(df.Vrsta, df.Tezina, title = "Scatter vrsta tezina", ylabel = "Tezina", xlabel = "Vrsta", legend = true)
display(plot)
savefig(plot,"vrstaTezina.html")

plot = scatter(df.DuzinaVertikalna, df.Tezina, title = "Scatter duzinaVertikala tezina", ylabel = "Tezina", xlabel = "duzinaVertikala", legend = true)
display(plot)
savefig(plot,"duzinaVertikalnaTezina.html")

plot = scatter(df.DuzinaDijagonalna, df.Tezina, title = "Scatter duzinaDijagonalna tezina", ylabel = "Tezina", xlabel = "duzinaDijagonalna", legend = true)
display(plot)
savefig(plot,"duzinaDijagonalnaTezina.html")

plot = scatter(df.Duzina, df.Tezina, title = "Scatter duzina tezina", ylabel = "Tezina", xlabel = "duzina", legend = true)
display(plot)
savefig(plot,"duzinaTezina.html")

plot = scatter(df.Visina, df.Tezina, title = "Scatter visina tezina", ylabel = "Tezina", xlabel = "visina", legend = true)
display(plot)
savefig(plot,"visinaTezina.html")

plot = scatter(df.Sirina, df.Tezina, title = "Scatter sirina tezina", ylabel = "Tezina", xlabel = "sirina", legend = true)
display(plot)
savefig(plot,"sirinaTezina.html")


covDuzinaDijagonalnaVertikalna = cov(df.DuzinaDijagonalna, df.DuzinaVertikalna)
if covDuzinaDijagonalnaVertikalna > 0.6
        select!(df,Not(:DuzinaVertikalna))
end

covDuzinaDijagonalnaDuzina = cov(df.DuzinaDijagonalna,df.Duzina)
if covDuzinaDijagonalnaDuzina > 0.6
        select!(df,Not(:Duzina))
end

filter!(row -> row.Tezina < 1500, df)

display(describe(df))

fm = @formula(Tezina ~ Vrsta + DuzinaDijagonalna + Visina + Sirina)
dfTrain,dfTest = Lathe.preprocess.TrainTestSplit(df,.75)
regressionModel = lm(fm,dfTrain)

predictedTrain = predict(regressionModel, dfTrain)
predictedTest = predict(regressionModel,dfTest)

errorsTrain = dfTrain.Tezina - predictedTrain
errorsTest = dfTest.Tezina - predictedTest

absMeanErrorsTest = mean(abs.(errorsTest))
mapeTest = mean(abs.(errorsTest ./ dfTest.Tezina))
mseTest = mean(errorsTest.*errorsTest)
rmseTest = sqrt(mseTest)

mseTrain = mean(errorsTrain.*errorsTrain)
rmseTrain = sqrt(mseTrain)
println("RMSE test $rmseTest, RMSE train $rmseTrain")

if rmseTrain < rmseTest
        println("Sistem je dobro istreniran")
else
        println("Sistem nije dobro istreniran")
end

rSquared = r2(regressionModel)
if rSquared > 0.5
        println("Model je dovoljno dobar za predvidnjanje")
end



