class Bottles
  def sing
    verses(99,0)
  end

  def verses(start, finish)
    start.downto(finish).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    create_verse(BottleNumber.for(number))
  end

  private

  def create_verse(bottle_number)
    <<~VERSE
      #{ bottle_number.quantity_container.capitalize} of beer on the wall, #{bottle_number.quantity_container} of beer.
      #{ bottle_number.action }, #{ bottle_number.successor.quantity_container} of beer on the wall.
      VERSE
  end

  class BottleNumber

    def self.for(number)
      bottle_numbers.fetch(number, BottleNumber).new(number)
    end

    def self.bottle_numbers
      {
        0 => BottleNumber0,
        1 => BottleNumber1,
        6 => BottleNumber6
      }
    end

    attr_reader :number

    def initialize(number)
      @number = number
    end

    def quantity_container
      "#{quantity} #{container}"
    end

    def container
      'bottles'
    end

    def pronoun
      'one'
    end

    def quantity
      number.to_s
    end

    def action
      "Take #{ pronoun } down and pass it around"
    end

    def successor
      BottleNumber.for(number-1)
    end
  end

  class BottleNumber1 < BottleNumber
    def pronoun
      'it'
    end

    def container
      'bottle'
    end
  end

  class BottleNumber6 < BottleNumber1
    def quantity
      '1'
    end

    def container
      'six pack'
    end
  end

  class BottleNumber0 < BottleNumber
    def action
        'Go to the store and buy some more'
    end

    def quantity
      'no more'
    end

    def successor
      BottleNumber.for(99)
    end

    def quantity
      'no more'
    end
  end
end
