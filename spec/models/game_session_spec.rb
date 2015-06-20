require 'rails_helper'

RSpec.describe GameSession, type: :model do
  it 'has a valid factory' do
    expect(build(:game_session)).to be_valid
  end

  let(:game_session) { create(:game_session) }

  it 'has a game title' do
    expect(game_session.game.title).not_to be_nil
    expect(game_session.game.title).to eq('Minecraft')
  end

  it 'has a game_mode title' do
    expect(game_session.game_mode.title).not_to be_nil
    expect(game_session.game_mode.title).to eq('Survival')
  end

  it 'has a total_players amount' do
    expect(game_session.game_mode.total_players).not_to be_nil
    expect(game_session.game_mode.total_players).to eq(6)
  end

  it 'has a start time' do
    expect(game_session.start_time).not_to be_nil
    expect(game_session.start_time).to be_within(1.minute).of(Time.now)
  end

  it 'has a end time' do
    expect(game_session.end_time).not_to be_nil
    expect(game_session.end_time).to be_within(1.minute).of(1.hour.from_now)
  end

  it 'has notes' do
    expect(game_session.notes).not_to be_nil
    expect(game_session.notes).to eq('Yea!! Let\'s make a castle!')
  end
end
