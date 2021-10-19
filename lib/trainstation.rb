# frozen_string_literal: true

require 'oyster'

class TrainStation
  def in(card)
    card.in
  end

  def out(card)
    card.out
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

  def show_last_journey(card)
    card.show_last_journey
  end
end
