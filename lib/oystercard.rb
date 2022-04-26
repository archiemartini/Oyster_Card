class OysterCard
  attr_reader :balance, :entry_station
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
  end

  def in_journey?
    true unless @entry_station == nil
  end

  def top_up(money)
    raise "Cannot exceed £#{MAXIMUM_BALANCE} balance" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    @balance < MINIMUM_BALANCE ? raise("Insufficient funds, balance must be at least £#{MINIMUM_BALANCE}") : @in_use = true
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  private
    def deduct(money)
      @balance -= money
    end
end
