FactoryGirl.define do
  factory :game_session do
    notes 'Yea!! Let\'s make a castle!'
    game_date Time.now
    start_time Time.now
    end_time 1.hour.from_now
    game
    game_mode
  end
end
