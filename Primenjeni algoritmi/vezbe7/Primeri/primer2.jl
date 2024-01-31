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
#Ispisemo statisticke podatke o Data setu
display(describe(df))
#Ispisemo distribuciju vrednosti boja
display(countmap(df[!, :Boja]))
#Ispisemo distribuciju vrednosti tipa
display(countmap(df[!, :Tip]))
#Ispisemo distribuciju vrednosti ostecenja
display(countmap(df[!, :Ostecenje]))
#Ispisemo distribuciju vrednosti stanja
display(countmap(df[!, :Stanje]))

#Mozemo izbaciti sve redove u kojima nedostaje cena i u kojima je cena 0
dropmissing!(df, [:Cena])
filter!(row ->row.Cena != 0, df)
#Posto kolona Boja ima 3841 nedostajucu vrednost, nema smisla koristiti je u regresiji. Uklonicemo je celu
select!(df, Not(:Boja))

#Podatke o stanju motoraa koji nedostaju mozemo zameniti stanjem  koje se najcesce pojavljuje u datasetu
df[ismissing.(df[!, :Stanje]), :Stanje] .= mode(skipmissing(df[!, :Stanje]))
#Istu stvar mozemo uraditi za ostecenje
df[ismissing.(df[!, :Ostecenje]), :Ostecenje] .= mode(skipmissing(df[!, :Ostecenje]))

#Za numericke kolone koje imaju malo nedostajucih vrednosti, mozemo ih popuniti prosekom ostalih vrednosti
df[ismissing.(df[!, :Kilometraza]), :Kilometraza] .= trunc(Int64,mean(skipmissing(df[!, :Kilometraza])))

#Ispisemo statisticke podatke o Data setu
display(describe(df))

#Nacrtamo scatter plot za svaku  promenljivu kako bismo identifikovali podatke koji jako odskacu kao i korelaciju
plotappl = scatter(df.Godiste, df.Cena, title = "Scatter Godiste - Cena", ylabel = "Cena", xlabel = "Godiste", legend = true)  
display(plotappl)
savefig(plotappl, "godistescatter.html")

plotcoap = scatter(df.Kilometraza, df.Cena, title = "Scatter kilometraza - cena", ylabel = "Cena", xlabel="Kilometraza", legend = true)  
display(plotcoap)
savefig(plotcoap, "kilometrazascatter.html")

plotloan = scatter(df.kW, df.Cena,  title = "Scatter KW - cena", ylabel = "Cena", xlabel = "kW", legend = true)  
savefig(plotloan, "kwscatter.html")

plotloanterm = scatter(df.KS, df.Cena,  title = "Scatter KS - Cena", ylabel = "Cena", xlabel = "KS", legend = true)  
savefig(plotloanterm, "ksscatter.html")

plotcredit = scatter(df.BrojCilindara, df.Cena, title = "Scatter broj cilindara - Cena", ylabel = "Cena", xlabel="Broj cilindara", legend = true)  
savefig(plotcredit, "brojCilindarascatter.html")

#izbacimo sve motore kojima je godiste iznad 2021 i ispod 1900
filter!(row ->row.Godiste <= 2021 && row.Godiste > 1900, df)
#izbacimo sve kojima je kilometraza veca od 500k
filter!(row ->row.Kilometraza <= 500000, df)
#izbacimo sve kojima je broj cilindara manji od 1 i veci od 300
filter!(row ->row.BrojCilindara > 0 && row.BrojCilindara < 300, df)

#Ako pogledamo grafike za KW i KS vidimo da su slicni sto ukazuje na potencijalnu multikolinearnost
covKwKs = cov(df.kW, df.KS)

#Ukoliko detektujemo multikolinearnost izbacimo jednu od promenljivih iz modela
if(covKwKs > 0.6)
    select!(df, Not(:kW))
end

# Sada su spremni podaci, pa hajde da istreniramo model 
fm = @formula(Cena ~ Stanje + Tip + Godiste + Kilometraza + Kubikaza + KS + BrojCilindara + Ostecenje )
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(df, .75)
regressionModel = lm(fm, dfTrain)

predictedTest = predict(regressionModel, dfTest)
predictedTrain = predict(regressionModel, dfTrain)

errorsTest = dfTest.Cena - predictedTest
errorsTrain = dfTrain.Cena - predictedTrain

rmseTest = sqrt(mean(errorsTest.*errorsTest))
rmseTrain = sqrt(mean(errorsTrain.*errorsTrain))

print("\nRMSE trening skupa je $rmseTrain, a test skupa $rmseTest\n")

print(r2(regressionModel))
if(r2(regressionModel) > 0.5)
    print("\nImamo dovoljno dobar model za predvidjanje.")
end

