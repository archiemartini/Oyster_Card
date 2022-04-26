class OysterCard
  attr_reader :balance
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  def initialize
    @balance = 0
    @in_use = false
  end 
  def top_up(money)
    raise "Cannot exceed £#{MAXIMUM_BALANCE} balance" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end
  def deduct(money)
    @balance -= money
  end
  
  def in_journey?
    @in_use
  end 
  
  def touch_in
    @balance < 1 ? raise("Insufficient funds, balance must be at least £#{MINIMUM_BALANCE}") : @in_use = true
  end
  
  def touch_out
    @in_use = false
  end
  
end