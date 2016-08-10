require 'transaction_log'

describe TransactionLog do

  subject(:transaction_log) { described_class.new(transaction_class_double) }

  let(:transaction_class_double) { double :transaction_class, :new => transaction }
  let(:transaction) {double :transaction, :date => Time.now.strftime("%d/%m/%Y"), :credit => 10, :debit => nil, :balance => 100}

  describe 'upon intialization' do
    it 'checks that we have a transactions variable' do
      expect(transaction_log.transactions).to eq([])
    end
  end

  describe '#new_log' do
    it 'adds new transaction to the log' do
      expect(transaction_log.new_log(10, 100)).to eq(transaction)
      expect(transaction_log.transactions).to eq([transaction])
    end
  end

end
