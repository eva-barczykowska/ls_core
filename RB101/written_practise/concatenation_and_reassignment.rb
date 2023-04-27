first = "I got"
second = " A"

p first
p second
p first + second # aha!
p first # nothing changed, first points where it used to point before (so using + hasn't changed the original objects)
p second # nothing changed, second points where it used to point before (so using + hasn't changed the original objects)

puts

p first += second
p first # first got REASSIGNED! Specifically it was reassigned to the value it was pointing concatenated with another value, the one referenced by second
p second
