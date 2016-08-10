require_relative 'transaction_log'

class Account

  attr_reader :balance, :transactions

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
    transactions.log.reverse.each do |t|
      t.credit != nil ? credit = sprintf('%.2f' % t.credit) : credit = nil
      t.debit != nil ? debit = sprintf('%.2f' % t.debit) : debit = nil
      balance = sprintf('%.2f' % t.balance)
      puts "#{t.date} || #{credit} || #{debit} || #{balance}"
    end
  end

end
