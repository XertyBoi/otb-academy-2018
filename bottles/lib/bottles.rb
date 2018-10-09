class Bottles
  def sing
    verses(99,0)
  end

  def verses(start, finish)
    start.downto(finish).map { |number| verse(number) }.join("\n")
  end


  def verse(number)
      <<~VERSE
        #{quantity_of_container(number).capitalize} of beer on the wall, #{quantity_of_container number} of beer.
        #{action number}, #{quantity_of_container number-1} of beer on the wall.
        VERSE
  end

  private
  def quantity_of_container(n)
    "#{quantity n} #{container n}"
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun number} down and pass it around"
    end
  end

  def pronoun(n)
    if n == 1
      "it"
    else
      "one"
    end
  end

  def quantity(n)
    if n == 0
      "no more"
    else
      minus_converter(n).to_s
    end
  end

  def minus_converter(n)
    if n < 0
      99
    else
      n
    end
  end

  def container(n)
    if n == 1
      "bottle"
    else
      "bottles"
    end
  end
end
