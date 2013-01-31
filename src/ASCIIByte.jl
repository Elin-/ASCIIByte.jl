module ASCIIByte

  ## Dependencies ##
  using Base.Intrinsics
  import Base.interp_parse_bytes

  ## Overwritten and/or extended methods ##
  importall Base

  ## Exported methods and types ##
  export ASCIIChar,
	uppercase!,
	lowercase!,
	swap!,
	swap,
	in,
	check,
	## 8-bit Char ##
	Char8,
	char8,
	@c8_str

  ## Load files ##
  include(Pkg.dir("ASCIIByte", "src", "asciichar.jl"))
  include(Pkg.dir("ASCIIByte", "src", "stringlike.jl"))
  include(Pkg.dir("ASCIIByte", "src", "alphabetsfunc.jl"))
  include(Pkg.dir("ASCIIByte", "src", "char8.jl"))

end