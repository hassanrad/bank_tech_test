class Transaction

  attr_reader :date
  attr_reader :credit
  attr_reader :debit

  def initialize(transaction_amount, balance)
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = transaction_amount if transaction_amount > 0
    @debit = -(transaction_amount) if transaction_amount < 0
    @balance = balance
  end

end
