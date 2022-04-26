require 'oystercard'
describe OysterCard do
 let(:station) { double :station } 
  
  it 'can display initial balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'can be topped up' do
    subject.top_up(35)
    subject.top_up(12)
    expect(subject.balance).to eq 47
  end

  it 'cannot be topped up above maximum balance' do
    expect { subject.top_up(OysterCard::MAXIMUM_BALANCE + 1) }.to raise_error 'Cannot exceed £90 balance'
  end

  it 'can touch in' do
    expect(subject).to respond_to(:touch_in)
  end

  it 'can touch out' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'knows when it is on a journey' do
    subject.top_up(OysterCard::MINIMUM_BALANCE)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it 'won\'t let user travel without minimum balance' do
    expect { subject.touch_in(station) }.to raise_error "Insufficient funds, balance must be at least £#{OysterCard::MINIMUM_BALANCE}"
  end

  it 'deducts balance on touch out' do
    subject.top_up(OysterCard::MINIMUM_BALANCE)
    allow(subject).to receive(:entry_station) {station}
    expect{ subject.touch_out }.to change{ subject.balance }.by(-OysterCard::MINIMUM_BALANCE)
  end

  it 'records entry station of current journey' do
    subject.top_up(OysterCard::MINIMUM_BALANCE)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end 

  it 'can forget entry station on touch out' do
    subject.top_up(OysterCard::MINIMUM_BALANCE)
    subject.touch_in(station)
    subject.touch_out
    expect(subject.entry_station).to eq nil
  end 

end
