# frozen_string_literal: true

require "journey"

INITIAL_BALANCE = 0
MAX_BALANCE = 30
MINIMUM_BALANCE = 1.80
COMPLETED_JOURNEY_FARE = 4.50
PENALTY_FARE = 15

class OysterCard
  attr_reader :balance, :in, :entry_point, :exit_point, :journeys

  def initialize(balance = INITIAL_BALANCE)
    @balance = balance
    @in = false
    @entry_point = ""
    @exit_point = ""
    @journeys = []
  end

  def add_balance(amount)
    receiving_value = amount + @balance
    raise "Exceeded maximum balance" unless receiving_value <= MAX_BALANCE

    @balance = receiving_value
  end

  def deduct(amount)
    @balance -= amount
  end

  def in(entry_point)
    raise "insufficient funds to travel" unless travelable?

    @entry_point = entry_point
    @in = true
  end

  def out(exit_point)
    @balance -= COMPLETED_JOURNEY_FARE
    raise "insufficient funds to travel" unless travelable?

    @exit_point = exit_point
    @journeys << Journey.new(@entry_point, @exit_point)
    @in = false
  end

  def travelable?
    @balance >= MINIMUM_BALANCE
  end

  def show_journeys
    @journeys
  end

  def check_valid_journey
    deduct(PENALTY_FARE) if entry_point == "" || exit_point == ""
  end
end
