include("population.jl")

function converge(bestFits)
        len = length(bestFits)
        if bestFits[len] < 0.01
                return true
        elseif len < 3
                return false
        else
                return bestFits[len - 2] == bestFits[len]
        end
end

function geneticAlgorythm(data, elitePercentage, mutationPercentage, crossoverPoint1, crossoverPoint2, values, weights, maxCapacity)
        calculatePopulationFitness!(data,weights,values,maxCapacity)
        populationSize = length(data)
        eliteSize = Int(elitePercentage*populationSize)
        eliteSize = eliteSize + (populationSize - eliteSize)%2
        bestFits = [data[1].fitness] 
        while !converge(bestFits)
                elite = deepcopy(selectPopulation(data,eliteSize))
                data = selectPopulation(data,populationSize - eliteSize)
                data = crossoverPopulation(data,crossoverPoint1,crossoverPoint2)
                mutatePopulation!(data,mutationPercentage)
                data = [data; elite]
                calculatePopulationFitness!(data,weights,values,maxCapacity)
                bestFits = [bestFits ; data[1].fitness]
        end
        return length(bestFits), data
end
