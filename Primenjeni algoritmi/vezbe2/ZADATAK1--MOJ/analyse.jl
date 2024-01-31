include("geneticAlgorithm.jl")

function calculateAverage(data,elitePercentage,crossoverPoint,mutationPercentage,num)
    averageGen = 0.0
    averageFit = 0.0
    for i in 1:num
        gen,pop = geneticAlgorithm!(data,elitePercentage,crossoverPoint,mutationPercentage)
        averageGen += gen
        averageFit += pop[1].fitness
    end
    averageGen = averageGen / num
    averageFit = averageFit / num
    return averageGen, averageFit
end

function findBestElitePercentage(data,eliteRange,crossoverPoint,mutationPercentage,num)
    resultsGen = []
    resultsFit = []
    for elitePercentage in eliteRange
        dataCopy = deepcopy(data)
        averageGen, averageFit = calculateAverage(dataCopy,elitePercentage,crossoverPoint,mutationPercentage,num)
        push!(resultsGen,averageGen)
        push!(resultsFit,averageFit)
    end
    minIndex = argmin(resultsFit)
    optimalValue = resultsFit[minIndex]
    return minIndex,optimalValue,resultsGen,resultsFit
end

function findBestCrossoverAndMutation(data,elitePercentage,crossoverRange,mutationRange,num)
    resultsGen = ones(length(crossoverRange), length(mutationRange))
    resultsFit = ones(length(crossoverRange),length(mutationRange))
    for i in 1:length(crossoverRange)
        crossoverPoint = crossoverRange[i]
        for j in 1:length(mutationRange)
            mutationPercentage = mutationRange[j]
            dataCopy = deepcopy(data)
            averageGen, averageFit =  calculateAverage(dataCopy,elitePercentage,crossoverPoint,mutationPercentage,num)
            resultsGen[i,j] = averageGen
            resultsFit[i,j] = averageFit
        end
    end
    coordinates = argmin(resultsFit)
    minCrossIndex = coordinates[1]
    minMutIndex = coordinates[2]
    optimalValue = resultsFit[minCrossIndex,minMutIndex]
    return minCrossIndex,minMutIndex,optimalValue,resultsGen,resultsFit
end