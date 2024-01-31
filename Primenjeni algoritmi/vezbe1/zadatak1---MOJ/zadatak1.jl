include("geneticAlgorythm.jl")

populationSize = 50
genesLength = 6
crossoverPoint = 3
mutatePercentage = 0.2
elitePercentage = 0.2
repeatSize = 3

population = generatePopulation(populationSize, genesLength)
calculatePopulationFitness!(population)
printPopulation(population)
popGen,repeatNumber,population = geneticAlgorythm(population,crossoverPoint,elitePercentage,repeatSize,mutatePercentage)
printPopulation(population)
println("Ukupan broj generacija je $popGen")
println("Broj ponavljanja najboljeg dobijenog rezultata je $repeatNumber")


