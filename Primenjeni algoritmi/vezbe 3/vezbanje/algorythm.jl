include("swarm.jl")


function PsoAlgorythm(swarm,maxVelocity,targetValue,maxIteration)
        globalBestParticle = swarm[1]
        globalBestParticle = calculateGlobalBestParticle(swarm,globalBestParticle,targetValue)
        for i in 1:maxIteration
                if globalBestParticle.currentValue == targetValue
                        printSwarm(swarm)
                        print("SOLUTION:")
                        printParticle(globalBestParticle)
                        println("Solution is found after $i iteracija")
                        return
                end
                updateSwarmVelocity!(swarm,globalBestParticle,maxVelocity)
                updateSwarmPosition!(swarm,targetValue)
                globalBestParticle = calculateGlobalBestParticle(swarm,globalBestParticle,targetValue)
        end
        printSwarm(swarm)
        print("Globaly best solution is")
        printParticle(globalBestParticle)
end

function calculateGlobalBestParticle(swarm,globalBestParticle,targetValue)
        for i in 1:length(swarm)
                if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
                        globalBestParticle = deepcopy(swarm[i])
                end
        end
        return globalBestParticle
end