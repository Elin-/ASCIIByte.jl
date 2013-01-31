## String to Char8 Array ##
st = "This is an ASCII string."
ar = c8"This is an ASCII array."
another = char8(st[12:16])

## Macth on Char8 Array ##
m = match(r"ASCII",ar)
dump(m)

## Change characters ##
swap(ar,'a','*')

## Using a IntSet as alphabet ##
vowels = IntSet('A','a','E','e','I','i','O','o','U','u')

idx = in(ar,vowels)
ar[ idx ]
check(ar,vowels)

## Swap using Dict ##
c8dic = (Char8=>Char8)[ char8('A')=>char8('4'), char('I')=>char8('1')]

swap!(ar,c8dic)

dic = ['A'=>1,'S'=>2,'C'=>3,'I'=>4]

intarray = swap(c8"ASCII Array",dic)

