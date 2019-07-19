function twomoon(n, sigma = 0.6,radius = 2)
  center1 = -1.0;
  center2 = 1.0;

  theta = pi*rand(n)
  noise = rand(n) .* sigma;
  semi_up = hcat((radius .+ noise) .*cos.(theta) .+ center1,(radius .+ noise) .* sin.(theta) .- 0.4);
  noise = rand(n)*sigma;
  semi_down = hcat((radius .+ noise) .*cos.(-theta) .+ center2, 0.4 .+ (radius .+ noise) .* sin.(-theta));
  x = vcat(semi_up,semi_down)'
  y = ones(Int,2*n)
  y[n+1:end] .= 2
  x, y
end

function spirals(n, k = 3)
  x = zeros(2,n*k)
  y = zeros(Int,n*k);
  r = range(0.0, stop = 2.5, length = n) |> collect
  for i in 1:k
    t = collect(range((i-1)*4, stop = 4*i, length = n))  + 0.2*randn(n)
    ix = (i-1)*n +1 : i*n
    x[:,ix] = vcat(transpose(r .* sin.(t)), transpose(r .* cos.(t)))
    y[ix] .= i
  end
  (x,y)
end
