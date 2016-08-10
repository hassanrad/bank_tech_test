require_relative 'transaction'

class TransactionLog

  attr_reader :log

  def initialize(log_type)
    @log = []
    @log_type = log_type
  end

  def self.build
    new(Transaction)
  end

  def new_log(amount, balance)
    new = @log_type.new(amount, balance)
    log << new
  end

end
