#Uros Grahovac PR100/2021
using MLBase
using DataFrames
using StatsBase
using CSV
using NearestNeighborModels
using MLJ
import Statistics
import Logging

Logging.disable_logging(Logging.Warn) #ignorise warning
data = DataFrame(CSV.File("DijabetesData.csv"))
#Prebacivanje odredjenih delova za predikciju i za rezultate u X1 i Y1
X1 = data[!,1:4]
Y1 = data[!,5]
#Prikazivanje nacina za prebacivanje X1 u X
schema(X1)
#Prebacivanje X1 i Y1 u X i Y(categoricalArray)
X = coerce(X1,:Starost => Count, :Tezina => Continuous, :Visina => Count, :Pol => Count)
Y = categorical(Y1)

k = 5
accuracy = 0.0

for i in 1:k
        accuratePredicted = 0.0
        train, test = partition(eachindex(Y), 0.8, shuffle=false)
        knnc = KNNClassifier(K = 5)
        knncMach = machine(knnc, X, Y)
        fit!(knncMach,rows=train)
        predicted = predict_mode(knncMach, rows=test)
        for i in 1:lastindex(predicted)
                if predicted[i] == Y[i]
                        accuratePredicted += 1
                end
        end
        numPredicted = lastindex(predicted)
        println("Broj tacno predvidjenih u $i. k je $accuratePredicted od ukupno $numPredicted")
        procenat = accuratePredicted / numPredicted * 100
        println("Procenast tacno predvidjenih u $i. k je $(round(procenat; digits = 2))%")
        global accuracy += procenat
        #Ovaj deo je umesto Kfold algoritma, prakticno radino slicnu stvar, uzeli smo 80% i 20% i premestamo podatke
        #kada stignemo do kraja, tj. do dela koji je jednak i iznad 80% mi taj deo prebacujemo na pocetak
        for i in 1: lastindex(X.Starost)
                osamdesetPosto = Int64(0.8 * lastindex(X.Starost))
                dvadesetPosto = Int64(0.2 * lastindex(X.Starost))
                if i <= osamdesetPosto
                        X.Starost[i] = X.Starost[i+dvadesetPosto]
                        X.Tezina[i] = X.Tezina[i+dvadesetPosto]
                        X.Visina[i] = X.Visina[i+dvadesetPosto]
                        X.Pol[i] = X.Pol[i+dvadesetPosto]
                        Y[i] = Y[i+dvadesetPosto]
                else
                        X.Starost[i] = X.Starost[i-osamdesetPosto]
                        X.Tezina[i] = X.Tezina[i-osamdesetPosto]
                        X.Visina[i] = X.Visina[i-osamdesetPosto]
                        X.Pol[i] = X.Pol[i-osamdesetPosto]
                        Y[i] = Y[i-osamdesetPosto]
                end
        end
end

accuracy /= k
println("Ukupna tacnost je $(round(accuracy; digits = 2))%")
if accuracy > 90
        println("Tacnost je jako dobra")
elseif accuracy > 80
        println("Tacnost je veoma dobra")
elseif accuracy > 70
        println("Tacnost je dosta dobra")
elseif accuracy > 50
        println("Tacnost je relativno dobra")
else
        println("Tacnost je losa")
end