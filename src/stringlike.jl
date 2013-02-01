## To Lower Case ##

function lowercase!{T<:ASCIIChar}(s::AbstractArray{T})
  for i = 1:length(s)
    if 'A' <= char(s[i]) <= 'Z'
      s[i] += 32
    end
  end
  return s
end

lowercase{T<:ASCIIChar}(s::AbstractArray{T}) = lowercase!(copy(s))

## To Upper Case ##

function uppercase!{T<:ASCIIChar}(s::AbstractArray{T})
  for i = 1:length(s)
    if 'a' <= char(s[i]) <= 'z'
      s[i] -= 32
    end
  end
  return s
end

function uppercase{T<:ASCIIChar}(s::AbstractArray{T}) = uppercase!(copy(s))

## Upper and Lower for ASCIIChar ##

uppercase{T<:ASCIIChar}(x::T) = convert(T,uppercase(uint8(x)))
lowercase{T<:ASCIIChar}(x::T) = convert(T,lowercase(uint8(x)))

## Matching ##

ismatch{T<:ASCIIChar}(r::Regex, s::Vector{T}) = ismatch(r, bytestring(s))

contains{T<:ASCIIChar}(s::Vector{T}, r::Regex) = ismatch(r,s)

match{T<:ASCIIChar}(re::Regex, s::Vector{T}, idx::Integer) = match(re,bytestring(s),idx)
match{T<:ASCIIChar}(r::Regex, s::Vector{T}) = match(r, bytestring(s), 1)

search{T<:ASCIIChar}(s::Vector{T}, r::Regex, idx::Integer) = search(bytestring(s),r,idx)
search{T<:ASCIIChar}(s::Vector{T}, r::Regex) = search(bytestring(s),r,1)

memchr{T<:ASCIIChar}(s::Vector{T}, c, i::Integer) = memchr(reinterpret(Uint8,s),c,i)
memchr{T<:ASCIIChar}(s::Vector{T}, c) = memchr(reinterpret(Uint8,s),c,1)

search{T<:ASCIIChar}(s::Vector{T}, c::Integer, i::Integer) = (res = memchr(s,c,i); (res,res+1))
search{T<:ASCIIChar}(s::Vector{T}, c::Integer) = search(s,c,1)

each_match{T<:ASCIIChar}(re::Regex, s::Vector{T}, ovr::Bool) = RegexMatchIterator(re,bytestring(s),ovr)
each_match{T<:ASCIIChar}(re::Regex, s::Vector{T}) = RegexMatchIterator(re,bytestring(s),false)

## Some String Function ##

repeat{T<:ASCIIChar}(s::Vector{T}, n::Int) = vec(repmat(s,n,1))

repeat{T<:ASCIIChar}(x::T, n::Int) = fill(x,n)

function swap!{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)
  pat = convert(T,p)
  cha = convert(T,c)
  for i in 1:length(x)
    if x[i] == pat
      x[i] = cha
    end
  end
  return x
end

swap{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc) = swap!(copy(x),p,c)

function replace{T<:ASCIIChar}(s::Vector{T}, pattern, r, limit::Integer)
    n = 1
    i = a = start(s)
    j, k  = search(s,pattern,i)
    res::Vector{T} = s[1:(j-1)]
    while j != 0
        if i < k
           if i!=a; append!(res,s[i:(j-1)]) end
	   isa(r,Vector) ? append!(res,r) : push!(res,r)
	   i = k
        end
        if k <= j; k = nextind(s,j) end
        j, k = search(s,pattern,k)
        if n == limit break end
        n += 1
    end
    if i<=length(s); append!(res,s[i:end]) end
    res
end

replace{T<:ASCIIChar}(s::Vector{T}, pat, r) = replace(s, pat, r, 0)