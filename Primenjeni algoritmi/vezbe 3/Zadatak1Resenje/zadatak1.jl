include("analyse.jl")

numberOfParticles = 10
numberOfOperands = 6 
minRang = -1
maxRang = 1
targetValue = 0 
maxIteration = 200
maxVelocity = 0.2
maxVelocityRange = collect(0.05:0.05:0.4)
repeatNum = 100

swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang)

numIter, GBP= PsoAlgorithm!(swarm,targetValue,maxIteration,maxVelocity)
println("Ukupan broj iteracija: $numIter")
println("Najbolje resenje je: ")
printParticle(GBP)

minIndex, optimalValue, resultsGen, resultsGBP = findBestMaxVelocity(swarm, targetValue, maxIteration, maxVelocityRange, repeatNum)

println("Vrednosti maxVelosity za koje vrsimo testiranje: $maxVelocityRange")
println("Optimalna vrednost za maxVelocity: $(maxVelocityRange[minIndex])")
println("Vrednost za optimalnu vrednost maxVelocity: $GBP")
println("Prosecne vrednosti za broj generacija: $resultsGen")
println("Prosecne vrednosti za najboolju cesticu: $resultsGBP")