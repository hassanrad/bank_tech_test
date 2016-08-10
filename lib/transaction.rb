class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(amount, balance)
    @date = Time.now.strftime("%d/%m/%Y")
    amount > 0 ? @credit = amount : @debit = amount.abs
    @balance = balance
  end

end
