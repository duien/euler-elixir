# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 * 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

defmodule Euler do
  def is_palindrome(n) do
    integer_to_list(n) == Enum.reverse(integer_to_list(n))
  end

  def products_up_to(max, current_a // 1, current_b // 1, products // [])
  def products_up_to(max, current_a, current_b, products)
      when current_b == max and current_a == max do
    products
  end
  def products_up_to(max, current_a, current_b, products)
      when current_b == max do
    products_up_to(max, current_a + 1, 1, [current_a * max] ++ products)
  end
  def products_up_to(max, current_a, current_b, products)
      when current_a == max do
    products_up_to(max, max, current_b + 1, [current_b * max] ++ products)
  end
  def products_up_to(max, current_a, current_b, products) do
    products_up_to(max, current_a, current_b + 1, [current_a * current_b] ++ products)
  end

  def palindrome_products(max) do
    Enum.filter( products_up_to(max), &is_palindrome/1 )
  end

  def largest_palindrome_product(max) do
    Enum.max(palindrome_products(max))
  end

  def lp(a, p) do
    case a > p and is_palindrome(a) do
      true -> a 
      false -> p
    end
  end

  def flpp(max, current_a // 1, current_b // 1, largest_palindrome // 0)
  def flpp(max, current_a, current_b, largest_palindrome)
      when current_b == max and current_a == max do
    lp(current_a * current_b, largest_palindrome)
  end
  def flpp(max, current_a, current_b, largest_palindrome)
      when current_b == max do
    flpp(max, current_a + 1, current_a + 1, lp(current_a * current_b, largest_palindrome))
  end
  def flpp(max, current_a, current_b, largest_palindrome) do
      # when current_a == max do
    flpp(max, current_a, current_b + 1, lp(current_a * current_b, largest_palindrome))
  end


end
