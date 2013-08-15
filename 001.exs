# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

defmodule Euler do
  def sum_multiples(max, current // 0, sum // 0)

  def sum_multiples(max, current, sum)
      when current >= max do
    sum
  end

  def sum_multiples(max, current, sum)
      when rem(current, 3) == 0 or rem(current, 5) == 0 do
    sum_multiples(max, current + 1, sum + current)
  end

  def sum_multiples(max, current, sum) do
    sum_multiples(max, current + 1, sum)
  end

end
