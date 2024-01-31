include("algorithm.jl")

numberOfParticles = 10
numberOfOperands = 6
minRang = -1
maxRang = 1
targetValue = 0
maxIteration = 200
maxVelocity = 10

swarm = generateSwarm(numberOfParticles,numberOfOperands,minRang,maxRang)

PsoAlgorithm(swarm,targetValue,maxIteration,maxVelocity)