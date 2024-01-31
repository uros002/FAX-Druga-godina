include("population.jl")

function geneticAlgorythm(data, crossoverPoint, elitePercentage, repeatSize,mutatePercentage )
        calculatePopulationFitness!(data)
        populationSize = length(data)
        eliteSize = Int(elitePercentage*populationSize)
        #Ako nam za ukrstanje ostane neparan broj jedinki povecacemo eliteSize za 1
        eliteSize = eliteSize + (populationSize - eliteSize)%2
        bestFit = data[1].fitness
        repeatNumber = 1
        popGen = 0
        while (data[1].fitness > 0) && (repeatNumber < repeatSize)
                elite = deepcopy(selectPopulation(data,eliteSize))
                data = crossoverPopulation(data,crossoverPoint)
                mutatePopulation!(data,mutatePercentage)
                data = [data; elite]
                calculatePopulationFitness!(data)
                data = selectPopulation(data,populationSize)
                if abs(bestFit - data[1].fitness) < 0.01
                        repeatNumber = repeatNumber + 1
                else
                        repeatNumber = 1
                        bestFit = data[1].fitness 
                end
                popGen = popGen + 1
        end

        return popGen,repeatNumber,data
end

