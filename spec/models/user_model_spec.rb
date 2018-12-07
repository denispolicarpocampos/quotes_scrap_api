require 'rails_helper'

RSpec.describe User, type: :model do
  it 'invalid without email and password' do
    user = User.new(email: nil, password: nil)
    expect(user).to_not be_valid
  end

  it 'unique email' do
    user = create(:user)
    user_2 = User.new(email: user.email, password: '12345678')
    expect(user_2).to_not be_valid
  end

  it 'email invalid' do
    user = User.new(email: 'teste', password: '12345678')
    expect(user).to_not be_valid
  end
end
