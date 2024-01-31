include("geneticAlgorythm.jl")

genesLength = 6
populationSize = 50
mutationPercentage = 0.2
elitePercentage = 0.2
crossoverPoint = 3
repeatSize = 100

population = generatePopulation(genesLength,populationSize)
calculatePopulationFitness!(population)
printPopulation(population)

popGen, population = geneticAlgorythm(population, mutationPercentage,elitePercentage,crossoverPoint,repeatSize)
print("Population: ")
printPopulation(population)
println("broj generacija je $popGen")
println("najbolji fitnes je $(population[1].fitness)")
