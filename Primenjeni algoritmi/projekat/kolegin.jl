#Vojin Velimirovic PR96/2021
using MLBase
using DataFrames
using StatsBase
using CSV
using NearestNeighborModels
using MLJ
using ROC
using MLJ
import Statistics
import Logging
Logging.disable_logging(Logging.Warn) #ignorise warning
println("-----------------------------POCETAK PROGRAMA------------------------------------")
X, y = @load_crabs
k = 5
ukupnaTacnost = 0.0
for i in 1:k
 brojTacnoPredvidjenih = 0.0
 train, test = partition(1:nrows(X), 0.2, shuffle=false)
 knnc = KNNClassifier()
 knnc_mach = machine(knnc, X, y)
 fit!(knnc_mach, rows=train)
 predicted = predict_mode(knnc_mach, rows=test)
 for i in 1:lastindex(predicted)
  if predicted[i] == y[i]
   brojTacnoPredvidjenih += 1
  end
 end
 ukupno = lastindex(predicted)
 println("Broj tacno predvidjenih u $i. k je $brojTacnoPredvidjenih od ukupno $ukupno")
 procenat = brojTacnoPredvidjenih / ukupno * 100
 println("Procenast tacno predvidjenih u $i. k je $procenat%")
 global ukupnaTacnost += procenat
 #POSTO NE MOZE PREKO K FOLDA
 #NA KRAJU SVAKE ITERACIJE FOR-A (1-5)
 #SVI ELEMENTI X i y SE PREBACUJU ZA 20 U NAPRED
 #ONI KOJI PRELAZE MAKSIMUM NAKON DODAVANJA 20 SE STAVLJAJU NA POCETAK
 #OVO BI TREBALO DA IMA ISTI EFEKAT KAO KFOLD
 for i in 1:lastindex(X.FL)
  osamdesetPosto = Int64(0.8 * lastindex(X.FL))
  dvadesetPosto = Int64(0.2 * lastindex(X.FL))
  if i <= osamdesetPosto
   X.FL[i] = X.FL[i+dvadesetPosto]
   X.RW[i] = X.RW[i+dvadesetPosto]
   X.CL[i] = X.CL[i+dvadesetPosto]
   X.CW[i] = X.CW[i+dvadesetPosto]
   X.BD[i] = X.BD[i+dvadesetPosto]
   y[i] = y[i+dvadesetPosto]
  else
   X.FL[i] = X.FL[i-osamdesetPosto]
   X.RW[i] = X.RW[i-osamdesetPosto]
   X.CL[i] = X.CL[i-osamdesetPosto]
   X.CW[i] = X.CW[i-osamdesetPosto]
   X.BD[i] = X.BD[i-osamdesetPosto]
   y[i] = y[i-osamdesetPosto]
  end
 end
end
println("")
ukupnaTacnost /= k
println("Ukupna tacnost je $ukupnaTacnost%")
if ukupnaTacnost > 90
 println("Tacnost je jako dobra")
elseif ukupnaTacnost > 80
 println("Tacnost je veoma dobra")
elseif ukupnaTacnost > 70
 println("Tacnost je dosta dobra")
elseif ukupnaTacnost > 50
 println("Tacnost je relativno dobra")
else
 println("Tacnost je losa")
end