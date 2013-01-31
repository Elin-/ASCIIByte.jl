ASCIIByte.jl
=========

Package for deal with Characters of 8 bits.

# Installation

# Features

* Abstract type `ASCIIChar` for creation of one byte characters
* 8-bit bitstype `Char8`
* Some string's functions working on ASCIIChar's Arrays:
  * Matching functions (search, replace and others)
  * Case conversion
* Tools for using IntSet/Set/Dict as alphabets
  * Test for characters on alphabet
  * Check for all characters on alphabet
  * Swap for alphabet conversions

# Demos

Demo for working with Char8 Arrays

```
julia> using ASCIIByte

julia> ar = c8"Char8!"
6-element Char8 Array:
 C
 h
 a
 r
 8
 !

julia> uppercase!(ar)
6-element Char8 Array:
 C
 H
 A
 R
 8
 !

julia> m=match(r"ar"i, ar)
RegexMatch("AR")

julia> dump(m)
RegexMatch 
  match: ASCIIString "AR"
  captures: Array(Union(Nothing,ASCIIString,UTF8String),(0,)) []
  offset: Int64 3
  offsets: Array(Int64,(0,)) []

julia> swap!(ar,'!','.')
6-element Char8 Array:
 C
 H
 A
 R
 8
 .

julia> vowels = IntSet('A','a','E','e','I','i','O','o','U','u')
IntSet(65, 69, 73, 79, 85, 97, 101, 105, 111, 117)

julia> check(ar,vowels)
C not in this IntSet
 in check at /home/dzea/.julia/ASCIIByte/src/alphabetsfunc.jl:18

julia> idx = in(ar,vowels)
6-element BitArray:
 false
 false
  true
 false
 false
 false

julia> vowelarray = ar[ idx ]
1-element Char8 Array:
 A

```

# Documentation

* [Library-style function reference](https://github.com/diegozea/ASCIIByte.jl)
