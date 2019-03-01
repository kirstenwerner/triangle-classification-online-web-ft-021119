require 'pry'
class Triangle
  
  attr_accessor :a, :b, :c 

  def initialize(a, b, c)
    @a = a 
    @b = b 
    @c = c
    @triangle_sides = [@a, @b, @c]
  end 
  
  def equilateral 
    if @a == @b && @a == @c 
      true 
    end
  end
  
  def isosceles 
    if (@a == @b && @a != @c) || (@a == @c && @a != @b) || (@b == @c && @b != @a)
      true 
    end 
  end
  
  def triangle_inequality
    if (@a + @b > @c) && (@a + @c > @b) && (@b + @c > @a)
      true 
    end 
  end 
    
  
  def kind 
    if @triangle_sides.any?{|num| num <= 0 || num == nil}
      raise TriangleError
    elsif self.equilateral == true 
      :equilateral 
    elsif self.isosceles == true && self.triangle_inequality == true 
      :isosceles 
    elsif self.triangle_inequality == true
      :scalene 
    else 
      raise TriangleError
    end 
  end 
  
  class TriangleError < StandardError
  end 
  
end
