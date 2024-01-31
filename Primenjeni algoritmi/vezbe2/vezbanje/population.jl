include("entity.jl")

function generatePopulation(populationSize,genesLength)
        data = []
        for i in 1:populationSize
                entity = generateEntity(genesLength)
                push!(data,entity)
        end
        return data
end

function printPopulation(data)
        for i in 1: length(data)
                printEntity(data[i])
        end
end

function crossoverPopulation(data,crossoverPoint)
        newData = []
        for i in 1:length(data)
                for j in 1:length(data)
                        entity1 = data[i]
                        entity2 = data[j]
                        crossover!(entity1,entity2,crossoverPoint)
                        push!(newData,entity1)
                        push!(newData,entity2)
                end
        end
        return newData
end

function mutatePopulation!(data,mutationPercentange)
        for i in 1 : length(data)
                mutate!(data[i],mutationPercentange)
        end
end

function selectPopulation(data,selectionSize)
        return deepcopy(data[1:selectionSize])
end

function calculatePopulationFitness!(data)
        for i in 1: length(data)
                calculateFitness!(data[i])
        end
        sort!(data, by = d -> d.fitness, rev = false)
end
