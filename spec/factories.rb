FactoryGirl.define do
  factory :recording do
    start_at Chronic.parse('Tomorrow at 7pm')
    end_at Chronic.parse('Tomorrow at 8pm')
    user
  end

  factory :user do
    sequence(:uid)
    username 'TweetVR_'
    token 'abc123'
    secret 'xyz890'

    ignore do
      number_of_recordings 0
    end

    after(:build) do |instance, evaluator|
      create_list(:recording, evaluator.number_of_recordings.to_i, user: instance)
    end
  end
end
