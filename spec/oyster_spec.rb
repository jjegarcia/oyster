# frozen_string_literal: true

require "oyster"
describe OysterCard do
  before do
  end
  it "initialize balance" do
    expect(subject.balance).to eq(INITIAL_BALANCE)
  end
  it "should add money to card" do
    subject.add_balance(20)
    expect(subject.balance).to eq 20
  end
  it "should not have too much money" do
    subject.add_balance(10)
    expect { subject.add_balance(100) }.to raise_error "Exceeded maximum balance"
  end
  it "should deducted money from card" do
    subject.add_balance(10)
    expect(subject.deduct(4.50)).to eq 5.50
  end
  it "should set a minimum journey requirement of balance" do
    subject.add_balance(5)
    subject.travelable?
    expect(subject.travelable?).to eq true
  end
  it "should set a minimum journey requirement of balance" do
    subject.add_balance(1.5)
    subject.travelable?
    expect(subject.travelable?).to eq false
  end
  it "should set a minimum journey requirement of balance" do
    subject.add_balance(1.80)
    subject.travelable?
    expect(subject.travelable?).to eq true
  end
  it "should be charged with penalty fare if not touch in or out" do
    subject = OysterCard.new(20)
    subject.check_valid_journey
    expect(subject.balance).to eq 5
  end
  it "should be charged with penalty fare if not touch  out" do
    subject = OysterCard.new(20)
    subject.in("entry")
    subject.check_valid_journey
    expect(subject.balance).to eq 5
  end
  it "should not charge if touched in and out" do
    subject = OysterCard.new(20)
    subject.in("entry")
    subject.out("exit")
    subject.check_valid_journey
    expect(subject.balance).to eq 15.5
  end
  it "should report \"insufficient funds to travel\" if not travable @in" do
    subject = OysterCard.new(0)
    expect { subject.in("lalala") }.to raise_error "insufficient funds to travel"
  end
  it "should prevent user to touch in if already has done so" do
    subject = OysterCard.new(20)
    subject.in("cook coo")
    expect { subject.in("woo hoo") }.to raise_error "already in"
  end
  it "should prevent user to touch out if already has done so" do
    subject = OysterCard.new(20)
    expect { subject.out("choo choo") }.to raise_error "already out"
  end
  it "should report insufficient funds to travel if not travable @out" do
    subject = OysterCard.new(20)
    subject.in("brub")
    subject.deduct(20)
    expect { subject.out("lalala") }.to raise_error "insufficient funds to travel"
  end
end
