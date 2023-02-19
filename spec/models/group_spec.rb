require 'rails_helper'

RSpec.describe Group, type: :model do
  # tests go here
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'd@gmail.com',
      password: 'password'
    )
    @group = Group.create(
      name: 'Groceries',
      icon: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png'),
      user_id: @user.id
    )
  end

  context 'validate data' do
    it 'name should be Groceries' do
      expect(@group.name).to eq('Groceries')
    end

    it 'it should have a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'should have an amount' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
