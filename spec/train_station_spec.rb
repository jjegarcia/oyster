require 'trainstation'
require 'oyster'
describe TrainStation do
  it 'should let the card in' do
    subject = TrainStation.new
    oyster = OysterCard.new
    expect(subject.in(oyster)).to eq true
  end
  it 'should let a card out' do
    subject = TrainStation.new
    oyster = OysterCard.new
    expect(subject.out(oyster)).to eq false
  end
  it 'should deduct completed journey fare when leaving station' do
    card = OysterCard.new
    card.add_balance(10)
    subject = TrainStation.new
    expect(subject.deduct(4.50, card)).to eq 5.50
  end

  it 'should tell me where I have travelled from' do
    card = OysterCard.new
    card.add_balance(15)
    subject = TrainStation.new
    subject.in(card)
    expect(subject.entry_point(card)).to eq 'St pancrass'
  end
  it 'should exit journeys' do
    card = OysterCard.new
    card.add_balance(15)
    subject = TrainStation.new
    subject.out(card)
    expect(subject.exit_point(card)).to eq 'Paddington'
  end
  it 'should show the previous journey' do
    card = OysterCard.new
    card.add_balance(15)
    subject = TrainStation.new
    subject.in(card)
    subject.out(card)
    expect(subject.show_last_journey(card)).to eq [{ 'St pancrass' => 'Paddington' }]
  end
end
