#1. Generisanje pocetne populacije
#2. Racunanje fitness-a za celu populaciju 
#3. Ponavljanje do pojave zasicenja
        #a. Izbor roditelja za ukrstanje 
        #b. Ukrstanje
        #c. Mutacija

include("population.jl")


function geneticAlgorithm!(data, fitValue, repeatSize, selectionSize, crossoverPoint, mutationPercentage)
        calculatePopulationFitness!(data,fitValue)
        bestFit = data[1].fitness
        repeatCount = 1
        popGen = 0
        while (data[1].fitness > 0) && (repeatCount < repeatSize)
                data = selectPopulation(data, selectionSize)
                data = crossoverPopulation(data,crossoverPoint)
                mutatePopulation!(data,mutationPercentage)     
                calculatePopulationFitness!(data,fitValue)     
                if bestFit == data[1].fitness
                        repeatCount = repeatCount + 1
                else
                        bestFit = data[1].fitness 
                        repeatCount = 1
                end
                popGen = popGen + 1 
                print("Generacija $popGen, bestfit $bestFit, broj ponavljanja $repeatCount\n")
        end
        return popGen, repeatCount, population
end