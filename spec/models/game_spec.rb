require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'has a valid factory' do
    expect(build(:game)).to be_valid
  end

  let(:game) { create(:game) }

  it 'should have a title' do
    expect(game.title).not_to be_nil
    expect(game.title).to eq('Minecraft')
  end

  it 'should have a description' do
    expect(game.description).not_to be_nil
    expect(game.description).to eq('Blocks!')
  end
end
