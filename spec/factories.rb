FactoryGirl.define do
  factory :user do
    sequence(:uid)
    username 'TweetVR_'
    token 'abc123'
    secret 'xyz890'
  end
end
