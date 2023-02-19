require 'rails_helper'

RSpec.describe 'Groups index page', type: :feature do
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

    sign_in(@user)
  end

  describe 'the group index page' do
    it 'displays the group name' do
      visit groups_path
      expect(page).to have_content(@group.name)
    end
  end
end
