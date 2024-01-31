include("population.jl")

function converge(bestFits,repeatSize)
        len = length(bestFits)
        if bestFits[len] < 0.001
                return true
        elseif len<3
                return false
        elseif len > repeatSize
                return true
        else
                return (bestFits[len - 2] - bestFits[len]) < 0.001
        end
end

function geneticAlgorythm(data,mutationPercentage,elitePercentage,crossoverPoint,repeatSize)
        calculatePopulationFitness!(data)
        populationSize = length(data)
        eliteSize = trunc(Int64, populationSize * elitePercentage)
        eliteSize = eliteSize + (populationSize - eliteSize)%2
        bestFits = [data[1].fitness]
        while !converge(bestFits,repeatSize)
                elite = deepcopy(selectPopulation(data,eliteSize))
                data = selectPopulation(data, populationSize - eliteSize)
                data = crossoverPopulation(data,crossoverPoint)
                mutatePopulation!(data,mutationPercentage)
                data = [data;elite]
                calculatePopulationFitness!(data)
                bestFits = [bestFits;data[1].fitness]
        end
        return length(bestFits), data
end