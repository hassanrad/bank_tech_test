require_relative 'transaction_log'

class Account

  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = TransactionLog.build
  end

  def deposit(amount)
    @balance += amount
    transactions.new_log(amount, balance)
  end

  def withdraw(amount)
    @balance -= amount
    transactions.new_log(-(amount), balance)
  end

  def statement
    puts 'date || credit || debit || balance'
  end

end
