include("geneticAlgorithm.jl")
genesLength = 6
populationSize = 50
crossoverPoint = 3
mutationPercentage = 0.2
elitePercentage = 0.2
totalRepeatSize = 100

population = generatePopulation(populationSize, genesLength)
calculatePopulationFitness!(population)
printPopulation(population)
popGen, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint, mutationPercentage, totalRepeatSize)
print("Populacija:\n")
printPopulation(population)
print("Ukupan broj generacija je $popGen \n")
print("Najbolji fitness: ", population[1].fitness)