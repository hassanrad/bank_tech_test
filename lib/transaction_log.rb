class TransactionLog

  attr_reader :log
  attr_reader :log_type

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
    new
  end

  def transactions
    log
  end

end
