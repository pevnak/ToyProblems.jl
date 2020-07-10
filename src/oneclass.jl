function onemoon(n, sigma = 0.6,radius = 2)
  center1 = -1.0;

  theta = pi*rand(1, n)
  noise = rand(1, n) .* sigma;
  vcat((radius .+ noise) .*cos.(theta) .+ center1,(radius .+ noise) .* sin.(theta) .- 0.4);
end

function thinnormal(n, ϵ = 1e-1)
	[1+ϵ 1; 1 1+ϵ] * randn(2, n)
end

function quadraticnormal(n, ϵ = 1e-1)
	z = 0.15*randn(1, n) .+ 0.2
	[z.^2; z] + ϵ * randn(2, n)
end

function sixgaussians(l, ρ = 8)
	x = reduce(hcat,[randn(2,l) .+ ρ .* [cos(ϕ), sin(ϕ)] for ϕ in 0:45:360])
	x = x[:,randperm(size(x,2))]
end

function flower(n;npetals = 8)
	theta = 1:npetals
	n = div(n, length(theta))
	mapreduce(hcat, theta * (2pi/npetals)) do t
		ct = cos(t)
		st = sin(t)

		x0 = randn(n) .+ 5.0
		y0 = randn(n) .* 0.3

		x = x0 * ct .- y0 * st
		y = x0 * st .+ y0 * ct
		[x y]'
	end
end

function flower2(n;npetals = 8)
	theta = 1:npetals
	n = div(n, length(theta))
	mapreduce(hcat, theta * (2pi/npetals)) do t
		ct = cos(t)
		st = sin(t)

		x0 = tanh.(randn(n) .- 1) .+ 4.0 .+ 0.05.* randn(n)
		y0 = randn(n) .* 0.3

		x = x0 * ct .- y0 * st
		y = x0 * st .+ y0 * ct
		[x y]'
	end
end

function twonormalonline(T, n; μ = 2)
	x₁ = rand([0, μ], 1, n)
	x₂ = randn(1, n)
	W = [-1.400151989263751 0.5819734942540326; -0.23739000637639154 0.939613866986273]
	b = [0.5, 0.5]
	T.(W * vcat(x₁, x₂) .+ b)
end

twonormalonline(n) = twonormalonline(Float32, n)
