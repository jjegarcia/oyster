require "oyster"

class TrainStation
  attr_reader :location

  def initialize(location = "")
    @location = location
  end

  def in(card)
    card.in(@location)
  end

  def out(card)
    card.out(@location)
  end

  def deduct(amount, card)
    card.deduct(amount)
  end

  def entry_point(card)
    card.entry_point
  end

  def exit_point(card)
    card.exit_point
  end

  def show_journeys(card)
    card.show_journeys
  end
end
