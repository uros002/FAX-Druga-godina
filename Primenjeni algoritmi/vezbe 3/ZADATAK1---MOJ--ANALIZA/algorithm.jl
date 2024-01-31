include("swarm.jl")

function converge(bestValues)
    len = length(bestValues)
    if bestValues[len] > -0.01 && bestValues[len] < 0.01
        return true
    elseif len < 5
        return false
    else
        return abs(bestValues[len - 4] - bestValues[len]) < 0.01
    end
end

function PsoAlgorithm!(swarm,targetValue,maxIteration,maxVelocity)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm,globalBestParticle,targetValue)
    bestValues = [globalBestParticle.currentValue]
    for i in 1:maxIteration
        if converge(bestValues)
            return i, globalBestParticle
        end
        updateSwarmVelocity!(swarm,globalBestParticle,maxVelocity)
        updateSwarmPosition!(swarm,targetValue)
        globalBestParticle = calculateGlobalBestParticle(swarm,globalBestParticle,targetValue)
        bestValues = [bestValues;globalBestParticle.currentValue]
    end
    return length(bestValues),globalBestParticle
end

function  calculateGlobalBestParticle(swarm,globalBestParticle,targetValue)
    for i in 1:length(swarm)
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
            globalBestParticle = deepcopy(swarm[i])
        end
    end
    return globalBestParticle
end