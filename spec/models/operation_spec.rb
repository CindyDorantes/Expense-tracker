require 'rails_helper'

RSpec.describe Group, type: :model do
  # tests go here
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'd@gmail.com',
      password: 'password'
    )
    @operation = Operation.create(
      name: 'Walmart',
      amount: 23,
      user_id: @user.id
    )
  end

  context 'validate data' do
    it 'name should be Walmart' do
      expect(@operation.name).to eq('Walmart')
    end

    it 'it should have a name' do
      @operation.name = nil
      expect(@operation).to_not be_valid
    end

    it 'should have an amount' do
      @operation.amount = nil
      expect(@operation).to_not be_valid
    end
  end
end