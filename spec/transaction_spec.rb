require 'transaction'

describe Transaction do

  subject(:transaction1) { described_class.new(10, 100) }
  subject(:transaction2) { described_class.new(-20, 80) }

  it 'will be initialized with the current date' do
    expect(transaction1.date).to eq(Time.now.strftime("%d/%m/%Y"))
  end

  it 'will be initialized with credit of amount deposited' do
    expect(transaction1.credit).to eq(10)
    expect(transaction1.debit).to eq(nil)
  end

  it 'will be initialized with debit of amount withdrawn' do
    expect(transaction2.debit).to eq(20)
    expect(transaction2.credit).to eq(nil)
  end

end
