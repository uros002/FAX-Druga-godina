using MLBase
using DataFrames
using StatsBase
using CSV
using NearestNeighborModels
using ROC
using MLJ
using Lathe
import Statistics
import Logging


data = DataFrame(CSV.File("Dijabetes1.csv"))

X1 = data[!, 1:2]
X = coerce(X1, :Starost => Multiclass , :Pol => Multiclass)
Y1 = data[!,3]
Y = categorical(Y1)

dataTrain , dataTest = Lathe.preprocess.TrainTestSplit(data,.80)

dataTrain = dataTrain[!,1:2]
dataTest = dataTest[!,1]

dataTrain = coerce(dataTrain, :Starost => Multiclass , :Pol => Multiclass)
#dataTest = categorical(dataTest)

knnc = KNNClassifier(K = 3)
knncMach = machine(knnc,X, Y)
predicted = predict_mode(knncMach,rows=dataTest)



