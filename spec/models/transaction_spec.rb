require 'spec_helper'

describe Transaction do
  before do 
    @transaction = Transaction.new(:category_id => 1, :description => "Test", :transaction_date => Time.now, 
                            :user_id => 1, :value => 100)
  end

  subject { @transaction }

  it { should respond_to(:category_id) }
  it { should respond_to(:description) }
  it { should respond_to(:transaction_date) }
  it { should respond_to(:user_id) }
  it { should respond_to(:value) }

  describe "when all data is valid" do
    it { should be_valid }
    it { @transaction.save.should == true }
  end

  describe "when transaction date is not a valid date" do
    before { @transaction.transaction_date = 'aaaa-mm-dd' }
    it { should_not be_valid }
  end
end