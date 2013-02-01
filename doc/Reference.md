ASCIIByte
=========

Package for deal with Characters of 8 bits.

	ASCIIChar

Abstract type for creation of 8-bit print-as-Char bitstypes
All basic operations defined for Char are defined for ASCIIChar too
* Conversion and promotion between types
* Sum and subtraction of Int values
* Comparisons
* Bitwise operations
* libc character class testing functions

String-like behavior for ASCIIChar Arrays
-----------------------------------------

	lowercase{T<:ASCIIChar}(x::T)
	lowercase!{T<:ASCIIChar}(s::AbstractArray{T})
	lowercase{T<:ASCIIChar}(s::AbstractArray{T})

Conversion of ASCIIChar and ASCIIChar Arrays to lowercase

	uppercase{T<:ASCIIChar}(x::T)
	uppercase!{T<:ASCIIChar}(s::AbstractArray{T})
	uppercase{T<:ASCIIChar}(s::AbstractArray{T})

Conversion of ASCIIChar and ASCIIChar Arrays to uppercase

	repeat{T<:ASCIIChar}(s::Vector{T}, n::Int)

Repeat n times an ASCIIChar Vector

	repeat{T<:ASCIIChar}(x::T, n::Int)

Repeat ASCIIChar for generate an ASCIIChar Vector

Matching on ASCIIChar Vectors
----------------------------

The next functions works as in String but on ASCIIChar Vectors:

	ismatch{T<:ASCIIChar}(r::Regex, s::Vector{T})
	contains{T<:ASCIIChar}(s::Vector{T}, r::Regex)
	match{T<:ASCIIChar}(re::Regex, s::Vector{T}, idx::Integer)
	match{T<:ASCIIChar}(r::Regex, s::Vector{T})
	search{T<:ASCIIChar}(s::Vector{T}, r::Regex, idx::Integer)
	search{T<:ASCIIChar}(s::Vector{T}, r::Regex)
	memchr{T<:ASCIIChar}(s::Vector{T}, c, i::Integer)
	memchr{T<:ASCIIChar}(s::Vector{T}, c)
	search{T<:ASCIIChar}(s::Vector{T}, c::Integer, i::Integer)
	search{T<:ASCIIChar}(s::Vector{T}, c::Integer)
	each_match{T<:ASCIIChar}(re::Regex, s::Vector{T}, ovr::Bool)
	each_match{T<:ASCIIChar}(re::Regex, s::Vector{T})
	replace{T<:ASCIIChar}(s::Vector{T}, pattern, r, limit::Integer)
	replace{T<:ASCIIChar}(s::Vector{T}, pat, r)

Swap between ASCIIChars on Arrays
---------------------------------

	swap!{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)
	swap{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)

Interchange a character for other

Char8
-----

	Char8

8-bit bitstype for character of one byte

	char8(x)
	char8(s::ASCIIString)
	char8 (x::AbstractArray)

Converts to Char8 or Char8's Array

	@c8_st

Creates a Char8 Array
