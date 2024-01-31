mutable struct Particle
    values :: Array{Float64,1}
    currentValue :: Float64
    velocity :: Array{Float64,1}
    bestValues :: Array{Float64,1}
    bestValue :: Float64
end

function generateParticle(numberOfOperands,minRang,maxRang)
    particle = Particle(rand(minRang:0.1:maxRang, numberOfOperands),0,
                fill(0.0,numberOfOperands),fill(0,numberOfOperands),0)
    updateValue!(particle)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue
    return particle
end

function updateValue!(particle)
    x = particle.values[1]
    y = particle.values[2]
    z = particle.values[3]
    w = particle.values[4]
    u = particle.values[5]
    v = particle.values[6]
    particle.currentValue = 4*x^2 - 6*x - 3*y^3 + 0.5*y + 3*z + 8*w - 6.1*u +2*v - 10
end

function printParticle(particle)
    x = particle.values[1]
    y = particle.values[2]
    z = particle.values[3]
    w = particle.values[4]
    u = particle.values[5]
    v = particle.values[6]
    println("4*$(round.(x; digits=4))^2 - 6*$(round.(x; digits=4)) - 3*$(round.(y; digits=4))^3",
            " + 0.5*$(round.(y; digits=4)) + 3*$(round.(z; digits=4)) + 8*$(round.(w; digits=4))",
            " - 6.1*$(round.(u; digits=4)) +2*$(round.(v; digits=4)) - 10 = $(particle.currentValue)")
end

# Vi = Cv*Vi + Cp*Rp*(Pi-Xi) + Cg*Rg*(g-Xi)
# Xi - trenutna vrednost
# Pi - lokalno najbolja
# g - globalno najbolja
# Cv = 1 Cp = 2 Cg = 2
function updateVelocity!(particle, globalBestParticle, maxVelocity)
    for i in 1:length(particle.velocity)
        particle.velocity[i] += 2.0*rand(Float64)*(particle.bestValues[i] - particle.values[i])+
                              2.0*rand(Float64)*(globalBestParticle.values[i] - particle.values[i])
        if particle.velocity[i] > maxVelocity
            particle.velocity[i] = maxVelocity
        elseif particle.velocity[i] < -maxVelocity
            particle.velocity[i] = -maxVelocity
        end
    end
end

#resenje mora da bude izmedju -1 i 1
function updatePosition!(particle, targetValue)
    for i in 1:length(particle.values)
        particle.values[i] += particle.velocity[i]
        if particle.values[i] > 1
            particle.values[i] = 1.0
        elseif particle.values[i] < -1
            particle.values[i] = -1.0
        end
    end
    updateValue!(particle)
    if abs(particle.bestValue - targetValue) > abs(particle.currentValue - targetValue)
        particle.bestValues = copy(particle.values)
        particle.bestValue = particle.currentValue
    end
end