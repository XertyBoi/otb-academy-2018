class VerseMaker

def get_verse(n)

  second_string = (n-1 == 0 ? "no more" : n-1)
  third_string = (n-1 < 0 ? 99 : second_string)

  if (n-1 < 0)
  second_string = 99
  end

  bottle_string = (n == 1 ? "bottle" : "bottles")
  second_bottle_string = (n-1 == 1 ? "bottle" : "bottles")
  take_string = (n == 1 ? "it" : "one")
  take_one_string = (n-1 < 0 ? "Go to the store and buy some more, " : "Take #{take_string} down and pass it around, ")

  expected = <<-VERSE
#{get_line_one(n)} #{get_line_two(n)}
#{take_one_string}#{third_string} #{second_bottle_string} of beer on the wall.
VERSE
end

def get_line_one(n)
  first_string = (n==0 ? "No more" : n)
  bottle_string = (n == 1 ? "bottle" : "bottles")

  line = <<-VERSE
#{first_string} #{bottle_string} of beer on the wall,
VERSE
end

def get_line_two(n)
  first_string = (n==0 ? "No more" : n)
  bottle_string = (n == 1 ? "bottle" : "bottles")
  "#{first_string.to_s.downcase} #{bottle_string} of beer."
end
end
