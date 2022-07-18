# Recursion
# another way to create a loop in Ruby
# the act of calling a method from within itself
def doubler(start_number)
  puts start_number
  doubler(start_number * 2) if start_number < 10
end

doubler(2)


def count_to_zero(number)
  puts number
  if number > 0
    count_to_zero(number - 1)
  end
end

count_to_zero(3)



