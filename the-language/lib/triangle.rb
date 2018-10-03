# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  sorted = [a,b,c].sort

  if negative_triangle_check(a,b,c)
    return
  end
  sorted.each{ |x| no_negative_sides(x) }
  no_inequal_triangles(a,b,c)

    if (a == b) && (b == c)
      :equilateral
    elsif (a == b) || (a == c) || (b == c)
      :isosceles
    else
      :scalene
  end
end

def no_negative_sides (side)
  raise TriangleError.new("All sides must be positive") if side <= 0
end

def no_inequal_triangles(a,b,c)
  if (a >= (b + c)) || (b >= (a + c)) || (c >= (a + b))
    raise TriangleError.new("Sum of one side cannot be greater than or = to the sum of the other 2")
  end
end

def negative_triangle_check(a,b,c)
  false
  if (a < 0) && (b < 0) && (c < 0)
      triangle(a.abs, b.abs, c.abs)
      true
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
