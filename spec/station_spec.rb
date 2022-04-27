require 'station'
describe Station do
  let(:zone6station) { Station.new("New cross", 6) }
  it "station returns the zone it is in" do
    expect(zone6station.zone).to eq 6
  end

  it "station returns the name it has" do
    expect(zone6station.name).to eq "New cross"
  end

end
