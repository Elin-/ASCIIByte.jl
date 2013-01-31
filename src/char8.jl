## Char8 ##

bitstype 8 Char8 <: ASCIIChar

## Conversions ##

char8(x) = convert(Char8,x)
char8(x::FloatingPoint) = char8(iround(x))

char8(s::ASCIIString) = reinterpret(Char8,copy(s.data))

char8(x::AbstractArray{Char8}) = x
import Base.iround_to
char8 (x::AbstractArray)= iround_to(similar(x,Char8), x)

macro c8_str(s);   ex = interp_parse_bytes(s); :(reinterpret(Char8,($ex).data)); end

