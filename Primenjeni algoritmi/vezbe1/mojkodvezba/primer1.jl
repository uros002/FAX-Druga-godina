include("geneticAlgorythm.jl")

genesLenght = 20
populationSize = 20
fitValue = 19

repeatSize = 3
selectionSize = 5
crossoverPoint = 3
mutatePercentage = 0.2

population = generatePopulation(populationSize, genesLenght)
calculatePopulationFitness(population,fitValue)
printPopulation(population)
popGen,repeatNumber,population = geneticAlgorythm!(population,fitValue,repeatSize,selectionSize,crossoverPoint,mutatePercentage)
printPopulation(population)
print("Ukupan broj generacija je $popGen \n")
print("Broj ponavljanja poslednjeg najboljeg fitness-a je $repeatNumber \n")