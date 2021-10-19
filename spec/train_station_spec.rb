# frozen_string_literal: true

require "trainstation"
require "oyster"
require "journey"
describe TrainStation do
  it "should let the card in" do
    subject = TrainStation.new("test_location")
    oyster = OysterCard.new
    expect(subject.in(oyster)).to eq true
  end
  it "should let a card out" do
    subject = TrainStation.new("test_location")
    oyster = OysterCard.new
    expect(subject.out(oyster)).to eq false
  end
  it "should deduct completed journey fare when leaving station" do
    card = OysterCard.new
    card.add_balance(10)
    subject = TrainStation.new("test_location")
    expect(subject.deduct(4.50, card)).to eq 5.50
  end

  it "should tell me where I have travelled from" do
    card = OysterCard.new
    card.add_balance(15)
    subject = TrainStation.new("test_location")
    subject.in(card)
    expect(subject.entry_point(card)).to eq "test_location"
  end
  it "should exit journeys" do
    card = OysterCard.new
    card.add_balance(15)
    subject = TrainStation.new("test_location")
    subject.out(card)
    expect(subject.exit_point(card)).to eq "test_location"
  end
  it "should show journeys" do
    card = OysterCard.new
    card.add_balance(15)
    entry_station = TrainStation.new("entry_location")
    entry_station.in(card)
    exit_station = TrainStation.new("exit_location")
    exit_station.out(card)

    journeys = exit_station.show_journeys(card)
    expect(journeys[0].entry_point[:entry]).to eq "entry_location"
    expect(journeys[0].exit_point[:exit]).to eq "exit_location"
  end
  it "should zone be displayed if requested" do
    subject = TrainStation.new("any", 3)
    expect(subject.zone).to eq 3
  end
end
