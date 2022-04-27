require 'journey'
require 'oystercard'

describe Journey do
  let(:station) {double :station, zone: 1}

  it 'knows the journey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns itself when exiting a journey' do
    expect(subject.end_journey(station)).to eq subject
  end

  context 'has just entry station' do
    subject { described_class.new(station) }
  
      it 'has an entry station' do
        expect(subject.entry_station).to eq station
      end

      it 'penalty fare if no exit' do
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end

      context 'has an exit station' do
        let(:station_2) {double :station_2}

        before do 

          subject.end_journey(station_2)
        end
        
        it 'calculates the normal fare' do
          expect(subject.fare).to eq OysterCard::MINIMUM_BALANCE
        end

        it 'knows the journey is complete' do
          expect(subject).to be_complete
        end
      end

  end

end
