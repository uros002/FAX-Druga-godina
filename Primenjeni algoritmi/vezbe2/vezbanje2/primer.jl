include("geneticAlgorithm.jl")

genesLength = 6
populationSize = 50
mutatePercentage = 0.2
elitePercentage = 0.2
crossoverPoint = 3
repeatSize = 100


population = generatePopulation(genesLength,populationSize)
calculatePopulationFitness!(population)
printPopulation(population)

popGen, population = geneticAlgorythm(population,mutatePercentage,elitePercentage,crossoverPoint,repeatSize)

print("Populacija:\n")
printPopulation(population)
print("Ukupan broj generacija je $popGen \n")
print("Najbolji fitness: ", population[1].fitness)