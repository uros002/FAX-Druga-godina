include("algorithm.jl")

function calculateAverage(swarm,targetValue,maxIteration,maxVelocity,num)
    averageGen = 0.0
    averageGBP = 0.0
    for i in 1:num
        gen,GBP = PsoAlgorithm!(swarm,targetValue,maxIteration,maxVelocity)
        averageGen += gen
        averageGBP += GBP.currentValue
    end
    averageGen = averageGen / num
    averageGBP = averageGBP / num
    return averageGen,averageGBP
end

function findBestMaxVelocity(swarm, targetValue, maxIteration, maxVelocityRange, num)
    resultsGen = []
    resultsGBP = []
    for maxVelocity in maxVelocityRange
        averageGen, averageGBP = calculateAverage(swarm,targetValue,maxIteration,maxVelocity,num)
        push!(resultsGen,averageGen)
        push!(resultsGBP,averageGBP)
    end
    minIndex = argmin(resultsGBP)
    optimalValue = resultsGBP[minIndex]
    return minIndex,optimalValue, resultsGen, resultsGBP
end