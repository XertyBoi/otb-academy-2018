require 'verse_maker'

class Bottles

  def verse(n)
    verses(n,n)
  end

  def sing
    verses(99,0)
  end

  def verses(start,finish)
    v_maker = VerseMaker.new

    current = start
    song = ""

    while current != finish-1

      song += v_maker.get_verse(current)
      if current != finish
        song += "\n"
      end
    current -= 1
    end
    song
  end
end
