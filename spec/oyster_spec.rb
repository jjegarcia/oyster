# frozen_string_literal: true

require "oyster"
describe OysterCard do
  it "initialize balance" do
    subject = OysterCard.new
    expect(subject.balance).to eq(INITIAL_BALANCE)
  end
  it "should add money to card" do
    subject = OysterCard.new
    subject.add_balance(20)
    expect(subject.balance).to eq 20
  end
  it "should not have too much money" do
    subject = OysterCard.new
    subject.add_balance(10)
    expect { subject.add_balance(100) }.to raise_error "Exceeded maximum balance"
  end
  it "should deducted money from card" do
    subject = OysterCard.new
    subject.add_balance(10)
    expect(subject.deduct(4.50)).to eq 5.50
  end
  it "should set a minimum journey requirment of balance" do
    subject = OysterCard.new
    subject.add_balance(5)
    subject.travelable?
    expect(subject.travelable?).to eq true
  end
  it "should set a minimum journey requirment of balance" do
    subject = OysterCard.new
    subject.add_balance(1.5)
    subject.travelable?
    expect(subject.travelable?).to eq false
  end
  it "should set a minimum journey requirment of balance" do
    subject = OysterCard.new
    subject.add_balance(1.80)
    subject.travelable?
    expect(subject.travelable?).to eq true
  end
end
