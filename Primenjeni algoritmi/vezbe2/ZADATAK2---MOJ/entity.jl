mutable struct Entity
        genes::Array{Int64, 1}
        fitness::Int64
    end
    
    function generateEntity(genesLength)
       return Entity(rand(0:1, genesLength), 0)
    end
    
    function printEntity(entity1)
       for i in 1:length(entity1.genes)
          print(entity1.genes[i])
       end
       print(" $(entity1.fitness) \n")
    end
    
function calculateFitness!(entity,values,weights,maxCapacity)
   selectedWeights = weights[entity.genes .==1]
   sumSelectedWeights = sum(selectedWeights)
   if sumSelectedWeights > maxCapacity
      entity.fitness = sum(values)
   else
      notSelectedValues = values[entity.genes .==0]
      entity.fitness = sum(notSelectedValues)
   end
end

function crossover!(entity1,entity2,crossoverPoint1,crossoverPoint2)
   for i in (crossoverPoint1+1):crossoverPoint2
      x = entity1.genes[i]
      entity1.genes[i] = entity2.genes[i]
      entity2.genes[i] = x
   end
end

function mutate!(entity,mutationPercentage)
   if rand(Float64) < mutationPercentage
      mutationPoint = rand(1:length(entity.genes))
      entity.genes[mutationPoint] = 1 - entity.genes[mutationPoint]
   end
end