# ToyProblems.jl
A small set of toy problems for anomaly detection and classification

One class problems: `onemoon`, `thingaussian`, and `quadraticgaussian.` All functions returns just a maxtrix with samples.

`x = onemoon(n, sigma = 0.6,radius = 2)` returns one moon from the famous two-moon problems

`x = thinnormal(n, ϵ = 1e-1)` returns a thin Gaussian (thinness controlled by `ϵ`) along the minor diagonal

`x = quadraticnormal(n, ϵ = 1e-1)` returns a one-dimensional Gaussian mapped to a parabola. `ϵ` controls the variance of additive noise


Two class problems: spirals and twomoon

`(x,y) = spirals(n, k = 3)`
`(x,y) = twomoon(n, sigma = 0.6,radius = 2)`
