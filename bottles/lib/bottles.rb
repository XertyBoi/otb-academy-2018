class Bottles
  def verse(n)
    case n
    when 2
      <<~VERSE
        #{n} bottles of beer on the wall, #{n} bottles of beer.
        Take one down and pass it around, #{n-1} bottle of beer on the wall.
      VERSE
    when 1
      <<~VERSE
        #{n} bottle of beer on the wall, #{n} bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
      VERSE
    when 0
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{n} bottles of beer on the wall, #{n} bottles of beer.
        Take one down and pass it around, #{n-1} bottles of beer on the wall.
      VERSE
    end
  end

  def verses(start,finish)
    song = start.downto(finish).map do |n|
      verse(n)
    end

    song.join("\n")
  end

  def sing
    verses(99,0)
  end
end
