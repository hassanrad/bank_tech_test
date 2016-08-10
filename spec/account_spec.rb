require 'account'

describe Account do

  subject(:account) { described_class.new }

  context 'upon initialization' do

    it 'checks that balance has zero balance' do
      expect(account.balance).to eq(0)
    end

  end

  context '#deposit' do
    it 'responds to deposit' do
      expect(account).to respond_to :deposit
    end

    it 'adds to balance of account' do
      account.deposit(1)
      expect(account.balance).to eq(1)
    end
  end

  context '#withdraw' do
    it 'responds to withdraw' do
      expect(account).to respond_to :withdraw
    end

    it 'removes from balance of account' do
      account.deposit(10)
      account.withdraw(1)
      expect(account.balance).to eq(9)
    end
  end

  context '#statement' do
    it 'displays empty account statement' do
      expect{account.statement}.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'displays an account statement with one debit transaction' do
      account.deposit(10)
      expect{account.statement}.to output("date || credit || debit || balance\nTime.now.strftime('%d/%m/%Y') || 10 || || 10\n").to_stdout
    end
  end

end
