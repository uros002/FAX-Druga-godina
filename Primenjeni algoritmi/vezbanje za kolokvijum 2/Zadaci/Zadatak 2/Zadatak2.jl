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

display(countmap(df[!,:Cena]))
select!(df,Not(:Cena))

display(countmap(df[!,:Vrsta]))
df[ismissing.(df[!,:Vrsta]), :Vrsta] .= mode(skipmissing(df[!,:Vrsta]))

df[ismissing.(df[!,:Duzina]), :Duzina] .= mean(skipmissing(df[!,:Duzina]))

display(describe(df))


plot = scatter(df.Vrsta, df.Tezina, title="Tezina-Vrsta",xlabel="Vrsta", ylabel="Tezina", legend=true)
savefig(plot,"vrstaTezina.html")

plot = scatter(df.DuzinaVertikalna, df.Tezina, title="Tezina-DuzinaVertikalna",xlabel="DuzinaVertikalna", ylabel="Tezina", legend=true)
savefig(plot,"duzinaVertikalnaTezina.html")

plot = scatter(df.DuzinaDijagonalna, df.Tezina, title="Tezina-DuzinaDijagonalna",xlabel="DuzinaDijagonalna", ylabel="Tezina", legend=true)
savefig(plot,"duzinaDijagonalnaTezina.html")

plot = scatter(df.Duzina, df.Tezina, title="Tezina-Duzina",xlabel="Duzina", ylabel="Tezina", legend=true)
savefig(plot,"duzinaTezina.html")

plot = scatter(df.Visina, df.Tezina, title="Tezina-Visina",xlabel="Visina", ylabel="Tezina", legend=true)
savefig(plot,"visinaTezina.html")

plot = scatter(df.Sirina, df.Tezina, title="Tezina-Sirina",xlabel="Sirina", ylabel="Tezina", legend=true)
savefig(plot,"sirinaTezina.html")


covDuzinaDijagonalnaVertikalna = cov(df.DuzinaDijagonalna, df.DuzinaVertikalna)
if covDuzinaDijagonalnaVertikalna>0.6
    select!(df, Not(:DuzinaVertikalna))
end

covDuzinaDijagonalna = cov(df.DuzinaDijagonalna, df.Duzina)
if covDuzinaDijagonalna>0.6
    select!(df,Not(:Duzina))
end

filter!(row -> row.Tezina<=1500, df)


fm = @formula(Tezina~Vrsta+DuzinaDijagonalna+Visina+Sirina)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(df,.75)
regresionModel = lm(fm, dfTrain)

predictTest = predict(regresionModel, dfTest)
predictTrain = predict(regresionModel, dfTrain)

errorTest = dfTest.Tezina - predictTest
errorTrain = dfTrain.Tezina - predictTrain

rmseTest = sqrt(mean(errorTest.*errorTest))
rmseTrain = sqrt(mean(errorTrain.*errorTrain))

println("RMSE test $rmseTest, RMSE train $rmseTrain")

println(r2(regresionModel))

if r2(regresionModel)>0.5
    println("Imamo dovoljno dobar model za predvidjanje")
end

