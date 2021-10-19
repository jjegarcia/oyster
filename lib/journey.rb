# frozen_string_literal: true

EMPTY_POINT = ""

class Journey
  attr_reader :entry_point, :exit_point, :content

  def initialize(entry_point = EMPTY_POINT, exit_point = EMPTY_POINT)
    @entry_point = { entry: entry_point }
    @exit_point = { exit: exit_point }
    @content = [@entry_point, @exit_point]
  end

  def save_entry(entry_point)
    @entry_point[:entry] = entry_point
  end

  def save_exit(exit_point)
    @exit_point[:exit] = exit_point
  end
end
