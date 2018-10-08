class Bottles

  def verse(n)
    verse_string = get_verse(n)
  end

  def sing
    verses(99,0)
  end

  def verses(start,finish)

    current = start
    song = ""

    while current != finish-1

      song += get_verse(current)
      if current != finish
        song += "\n"
      end
    current -= 1
    end

    song
  end

  def get_verse(n)

    first_string = (n==0 ? "No more" : n)
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
#{first_string} #{bottle_string} of beer on the wall, #{first_string.to_s.downcase} #{bottle_string} of beer.
#{take_one_string}#{third_string} #{second_bottle_string} of beer on the wall.
VERSE
  end
end
