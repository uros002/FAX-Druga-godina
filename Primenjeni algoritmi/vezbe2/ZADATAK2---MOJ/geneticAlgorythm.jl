include("population.jl")

function converge(bestFits)
        len = length(bestFits)
        if bestFits[len] < 0.001
                return true
        elseif len < 3
                return false
        else 
                return (bestFits[len - 2] - bestFits[len]) < 0.001
        end
end

function geneticAlgorythm(data,elitePercentage, crossoverPoint1, crossoverPoint2,
                                mutationPercentage, values, weights, maxCapacity)
        calculatePopulationFitness!(data,values,weights,maxCapacity)
        populationSize = length(data)
        eliteSize = trunc(Int64,populationSize*elitePercentage)
        eliteSize = eliteSize + (populationSize - eliteSize)%2
        bestFits = [data[1].fitness]
        while !converge(bestFits)
                elite = deepcopy(selectPopulation(data,eliteSize))
                data = selectPopulation(data,populationSize - eliteSize)
                data = crossoverPopulation(data,crossoverPoint1,crossoverPoint2)
                mutatePopulation!(data,mutationPercentage)
                data = [data;elite]
                calculatePopulationFitness!(data,values,weights,maxCapacity)
                bestFits = [bestFits;data[1].fitness]
        end
        return length(bestFits),data
end