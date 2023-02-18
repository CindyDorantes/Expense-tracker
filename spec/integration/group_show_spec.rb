require 'rails_helper'

RSpec.describe 'Groups show page', type: :feature do
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

    @operation = Operation.create(
      name: 'Walmart',
      amount: 23,
      user_id: @user.id
    )

    @group.operations << @operation

    sign_in(@user)
  end

  describe 'the group index page' do
    it 'displays the group name' do
      visit group_path(@group.id)
      expect(page).to have_content(@operation.name)
    end
  end
end