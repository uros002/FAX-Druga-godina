include("geneticAlgorythm.jl")

genesLength = 20
populationSize = 20
fitValue = 19

repeatSize = 3
selectionSize = 5
crossoverPoint = 3
mutationPercentage = 0.2


population = generatePopulation(populationSize,genesLength)
calculatePopulationFitness!(population,fitValue)
printPopulation(population)
popGen, repeatNum, population = geneticAlgorithm!(population, fitValue, repeatSize, selectionSize, crossoverPoint, mutationPercentage)
printPopulation(population)
print("Ukupan broj generacija je $popGen\n")
print("Broj ponavljanja poslednjeg najboljeg fitness-a je $repeatNum\n")