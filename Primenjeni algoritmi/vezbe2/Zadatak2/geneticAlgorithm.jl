include("population.jl")

function converge(bestFits)
   len = length(bestFits)
   if bestFits[len]<0.01
      return true
   elseif len<3
      return false
   else 
      return bestFits[len-2]==bestFits[len]
   end
end

function geneticAlgorithm!(data, elitePercentage, crossoverPoint1, crossoverPoint2,
                           mutationPercentage, values, weights, maxCapacity)
     calculatePopulationFitness!(data, values, weights, maxCapacity)
     populationSize = length(data)
     eliteSize = Int(trunc(elitePercentage*populationSize))
     # Ako nam za ukrstanje ostaje neparan broj jedinki, povecamo eliteSize za 1
     eliteSize = eliteSize+(populationSize-eliteSize)%2
     bestFits = [data[1].fitness]
     while !converge(bestFits)
        elite = deepcopy(selectPopulation(data, eliteSize))
	data = selectPopulation(data, populationSize-eliteSize)
	data = crossoverPopulation(data, crossoverPoint1, crossoverPoint2)
        mutatePopulation!(data, mutationPercentage)
	data = [data; elite]
        calculatePopulationFitness!(data, values, weights, maxCapacity)
	bestFits = [bestFits; data[1].fitness]
     end
     return length(bestFits), data
end
