require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { create(:user) }

  it 'has a user_name' do
    expect(user.user_name).not_to be_nil
    expect(user.user_name).to eq('testuser')
  end

  it 'has an xbox name' do
    expect(user.xbox_name).not_to be_nil
    expect(user.xbox_name).to eq('testuser')
  end

  it 'has a password' do
    expect(user.password).not_to be_nil
    expect(user.password).to eq('password')
  end

  it 'has a time zone' do
    expect(user.time_zone).not_to be_nil
    expect(user.time_zone).to eq('Eastern Time (US & Canada)')
  end
end
