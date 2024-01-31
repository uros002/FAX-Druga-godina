include("population.jl")

function geneticAlgorythm!(data, fitValue, repeatSize, selectionSize, crossoverPoint, mutatePercentage)
        calculatePopulationFitness(data,fitValue)
        bestFit = data[1].fitness
        repeatCount = 1
        popGen = 0
        while (data[1].fitness > 0) && (repeatCount < repeatSize)
                data = selectPopulation(data,selectionSize)
                data = crossoverPopulation(data,crossoverPoint)
                mutatePopulation!(data, mutatePercentage)
                calculatePopulationFitness(data,fitValue)
                if bestFit == data[1].fitness 
                        repeatCount = repeatCount + 1
                else
                        bestFit = data[1].fitness 
                        repeatCount = 1
                end

                popGen = popGen + 1
                print("Generacija $popGen, bestFit $bestFit, broj ponavljanja $repeatCount")

        end
        return popGen, repeatCount, population
end