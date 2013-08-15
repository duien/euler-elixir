# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

defmodule Euler do
  def largest_prime_factor(n) do
    Enum.max(prime_factors(n))
  end

  def prime_factors(n, factors // [])
  def prime_factors(n, factors) do
    case smallest_divisor(n) do
      ^n -> factors ++ [n]
      f -> factors ++ [f] ++ prime_factors(div(n, f))
    end
  end

  def smallest_divisor(n, factor // 2)
  def smallest_divisor(n, factor) when rem(n, factor) == 0 do
    factor
  end
  def smallest_divisor(n, factor) do
    smallest_divisor(n, factor + 1)
  end

end

