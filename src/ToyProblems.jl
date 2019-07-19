module ToyProblems
export twomoon, spirals
include("twoclass.jl")
for p in [:spirals, :twomoon]
	@eval begin 
		function $(p)(::Type{T}, args...) where {T}
		  x, y = $(p)(args...);
		  (T.(x), y)
		end
	end
end

export thinnormal, quadraticnormal, onemoon
include("oneclass.jl")
for p in [:thinnormal, :quadraticnormal, :onemoon]
	@eval $(p)(::Type{T}, args...) where {T} = T.($(p)(args...))
end

end # module
