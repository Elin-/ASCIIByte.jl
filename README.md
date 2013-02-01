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

julia> ar = c8"8-bit array"
11-element Char8 Array:
 8
 -
 b
 i
 t
  
 a
 r
 r
 a
 y

julia> uppercase!(ar);

julia> swap!(ar,'-',' ')
11-element Char8 Array:
 8
  
 B
 I
 T
  
 A
 R
 R
 A
 Y

julia> match(r"array"i, ar)
RegexMatch("ARRAY")

julia> vowels = IntSet('A','a','E','e','I','i','O','o','U','u')
IntSet(65, 69, 73, 79, 85, 97, 101, 105, 111, 117)

julia> IntSet(65, 69, 73, 79, 85, 97, 101, 105, 111, 117)
IntSet(65, 69, 73, 79, 85, 97, 101, 105, 111, 117)

julia> check(ar,vowels)
8 not in this IntSet
 in check at /home/dzea/.julia/ASCIIByte/src/alphabetsfunc.jl:18

julia> idx = in(ar,vowels)
11-element BitArray:
 false
 false
 false
  true
 false
 false
  true
 false
 false
  true
 false

julia> vowelarray = ar[ idx ]
3-element Char8 Array:
 I
 A
 A

```

# Documentation

* [Library-style function reference](https://github.com/diegozea/ASCIIByte.jl/blob/master/doc/Reference.md)
