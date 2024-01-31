#stavljamo da je mutable da bi mogla da se menja posle inicijalizacije
mutable struct Entity
        genes :: Array{Int64,1}
        fitness :: Int64
end

#generisanje entiteta
function generateEntity(genesLength)
        return Entity(rand(0:1,genesLength),0)
end

#racunanje fitnesa
#apsolutnu razliku broja jedinica u jedinki i
#zeljenog broja jedinica 
function calculateFitnes!(entity, fitValue)
        entity.fitness = 0
        for i in 1:length(entity.genes)
                entity.fitness += entity.genes[i]
        end
        entity.fitness = abs(entity.fitness - fitValue)
end

function crossover!(entity1, entity2, crossoverPoint)
        for i in 1:crossoverPoint
                x = entity1.genes[i]
                entity1.genes[i] = entity2.genes[i]
                entity2.genes[i] = x 
        end
end

function mutation!(entity, mutationPercentage)
        if(rand(Float64)< mutationPercentage)
                mutationPoint = rand(1:length(entity.genes))
                entity.genes[mutationPoint] = 1 - entity.genes[mutationPoint]
        end

end

#stampanje entiteta
function printEntity(entity)
        for i in 1:length(entity.genes)
                print(entity.genes[i])
        end
        print( " $(entity.fitness) \n" )
end
