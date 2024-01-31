include("algorythm.jl")

numberofParticles = 10
numberOfOperands = 4 #n
minRang = 140
maxRang = 200
maxVelocity = 10
targetValue = 210
maxIteration = 2000

swarm = generateSwarm(numberofParticles,numberOfOperands,minRang, maxRang)

PsoAlgorythm(swarm,maxVelocity,targetValue,maxIteration)