FactoryGirl.define do
  factory :game_session do
    game
    game_mode
    notes 'Yea!! Let\'s make a castle!'
    game_date Time.now
    start_time Time.now
    end_time Time.now + 1
  end

end
