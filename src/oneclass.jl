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