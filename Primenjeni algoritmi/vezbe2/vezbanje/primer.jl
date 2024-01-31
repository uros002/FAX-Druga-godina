include("geneticAlgorithm.jl")

populationSize = 50
genesLength = 6
crossoverPoint = 3
mutationPercentage = 0.2
elitePercentage = 0.2
repeatSize = 100

population = generatePopulation(populationSize,genesLength)
calculatePopulationFitness!(population)
printPopulation(population)

popGen, repeatNum, population = geneticAlgorithm(population,crossoverPoint,mutationPercentage,elitePercentage,repeatSize)

print("Populacija:\n")
printPopulation(population)
print("Ukupan broj generacija je $popGen \n")
print("Najbolji fitness: ", population[1].fitness)