include("swarm.jl")

function PsoAlgorithm(swarm,targetValue, maxIteration, maxVelocity)
        globalBestParticle = swarm[1];
        globalBestParticle = generateGlobalBestParticle(swarm,globalBestParticle, targetValue)
        for i in 1 : maxIteration
                if globalBestParticle.currentValue == targetValue
                        printSwarm(swarm)
                        println("SOLUTION:")
                        printParticle(globalBestParticle)
                        println("Solution found after $i iteracija!")
                        return
                end
                updateSwarmVelocity!(swarm,globalBestParticle,maxVelocity)
                updateSwarmPosition!(swarm,targetValue)
                globalBestParticle = generateGlobalBestParticle(swarm,globalBestParticle,targetValue)
        end
        printSwarm(swarm)
        println("Globaly best solution:")
        printParticle(globalBestParticle)
end

function generateGlobalBestParticle(swarm,globalBestParticle, targetValue)
        for i in 1: length(swarm)
                if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
                        globalBestParticle = deepcopy(swarm[i]);
                end
        end
        return globalBestParticle
end
