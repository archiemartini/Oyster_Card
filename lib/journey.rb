class Journey
  
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station=nil)
    @entry_station = entry_station
  end
  
  def complete?
    @entry_station == nil || exit_station == nil ? false : true
      
  end

  def fare
  complete? ? OysterCard::MINIMUM_BALANCE : PENALTY_FARE 
  end

  def end_journey(station)
    @exit_station = station
    self
  end


end