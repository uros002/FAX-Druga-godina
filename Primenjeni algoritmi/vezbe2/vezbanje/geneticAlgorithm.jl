include("population.jl")

function geneticAlgorithm(data,crossoverPoint,mutationPercentage,elitePercentage,repeatSize)
        calculatePopulationFitness!(data)
        populationSize = length(data)
        eliteSize = Int(trunc(populationSize * elitePercentage))
        eliteSize = eliteSize + (populationSize - eliteSize)%2
        bestFit = data[1].fitness 
        repeatNum = 1
        popGen = 0
        while (data[1].fitness > 0) && (repeatNum < repeatSize)
                elite = deepcopy(selectPopulation(data,eliteSize))
                data = selectPopulation(data,populationSize - eliteSize)
                data = crossoverPopulation(data,crossoverPoint)
                mutatePopulation!(data,mutationPercentage)
                data = [data;elite]
                calculatePopulationFitness!(data)
                if bestFit == data[1].fitness
                        repeatNum = repeatNum + 1     
                else
                        repeatNum = 0
                        bestFit = data[1].fitness 
                end
                popGen = popGen + 1 
        end
        return popGen, repeatNum, data
end