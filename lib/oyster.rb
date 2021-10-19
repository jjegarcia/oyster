# frozen_string_literal: true

require "journey"

INITIAL_BALANCE = 0
MAX_BALANCE = 30
MINIMUM_BALANCE = 1.80
COMPLETED_JOURNEY_FARE = 4.50

class OysterCard
  attr_reader :balance, :in, :entry_point, :exit_point, :journeys

  def initialize(balance = INITIAL_BALANCE)
    @balance = balance
    @in = false
    @entry_point = ""
    @exit_point = ""
    @journeys = []
  end

  def add_balance(money)
    receiving_value = money + @balance
    raise "Exceeded maximum balance" unless receiving_value <= MAX_BALANCE

    @balance = receiving_value
  end

  def deduct(amount)
    @balance -= amount
  end

  def in(entry_point)
    @entry_point = entry_point
    @in = true
  end

  def out(exit_point)
    @balance -= COMPLETED_JOURNEY_FARE
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
end
