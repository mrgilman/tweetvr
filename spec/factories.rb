FactoryGirl.define do
  factory :recording do
    sequence(:start_at) { |i| i.hours.from_now }
    sequence(:end_at) { |i| i.hours.from_now + 30.minutes }
    user
  end

  factory :user do
    sequence(:uid)
    username 'TweetVR_'
    image_url 'http://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png'
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
