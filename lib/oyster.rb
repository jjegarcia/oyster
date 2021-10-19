# frozen_string_literal: true

INITIAL_BALANCE = 0
MAX_BALANCE = 30
MINIMUM_BALANCE = 1.80
COMPLETED_JOURNEY_FARE = 4.50

class OysterCard
  attr_reader :balance, :in, :entry_point, :exit_point, :journeys

  def initialize
    @balance = INITIAL_BALANCE
    @in = false
    @entry_point = ''
    @exit_point = ''
    @journeys = []
  end

  def add_balance(money)
    recieving_value = money + @balance
    raise 'Excceded maximum balance' unless recieving_value <= MAX_BALANCE

    @balance = recieving_value
  end

  def deduct(amount)
    @balance -= amount
  end

  def in
    @entry_point = 'St pancrass'
    @in = true
  end

  def out
    @balance -= COMPLETED_JOURNEY_FARE
    @exit_point = 'Paddington'
    @journeys << { @entry_point => @exit_point }
    @in = false
  end

  def travellable?
    @balance >= MINIMUM_BALANCE
  end

  def show_last_journey
    @journeys
  end
end
