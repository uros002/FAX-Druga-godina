include("algorithm.jl")

function calculateAverage(swarm, targetValue, maxIteration, maxVelocity, num)
     averageGen = 0.0
     averageGBP = 0.0
     for i in 1:num
         swarmCopy = deepcopy(swarm)
         gen, GBP = PsoAlgorithm!(swarmCopy, targetValue, maxIteration, maxVelocity)
	     averageGen += gen
	     averageGBP += GBP.currentValue
     end
     averageGen = averageGen / num
     averageGBP = averageGBP / num
     return averageGen, averageGBP
end

function findBestMaxVelocity(swarm, targetValue, maxIteration, maxVelocityRange, repeatNum)
    resultsGen = [];
    resultsGBP = [];
    for maxVelocity in maxVelocityRange
        dataCopy = deepcopy(swarm)
        averageGen, averageGBP = calculateAverage(swarm, targetValue, maxIteration, maxVelocity, repeatNum)
	    push!(resultsGen, averageGen)
        push!(resultsGBP, averageGBP)
    end
    minIndex = argmin(resultsGBP)
    optimalValue = resultsGBP[minIndex]
    return minIndex, optimalValue, resultsGen, resultsGBP
end