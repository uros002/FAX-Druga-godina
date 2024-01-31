include("entity.jl")

function generatePopulation(genesLength,n)
        data = []
        for i in 1:n
                entity = generateEntity(genesLength)
                push!(data,entity)
        end
        return data
end

function printPopulation(data)
        for i in 1:length(data)
                printEntity(data[i])
        end
end

function calculatePopulationFitness!(data)
        for i in 1:length(data)
                calculateFitness!(data[i])
        end
        sort!(data, by = d -> d.fitness,rev = false)
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

function mutatePopulation!(data,mutationPercentage)
        for i in 1:length(data)
                mutate!(data[i],mutationPercentage)
        end
end

function selectPopulation(data,n)
        return deepcopy(data[1:n])
end