require 'rails_helper'

RSpec.describe GameMode, type: :model do
  it 'has a valid factory' do
    expect(build(:game_mode)).to be_valid
  end

  let(:game_mode) { create(:game_mode) }

  it 'has a title' do
    expect(game_mode.title).not_to be_nil
    expect(game_mode.title).to eq('Survival')
  end

  it 'has total amount of players' do
    expect(game_mode.total_players).not_to be_nil
    expect(game_mode.total_players).to eq(6)
  end

  it 'has a game id' do
    expect(game_mode.game_id).not_to be_nil
    expect(game_mode.game_id).to eq(1)
  end
end
