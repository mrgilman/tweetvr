class User < ActiveRecord::Base
  validates :uid, presence: true, uniqueness: true
  validates :username, presence: true
  validates :token, presence: true
  validates :secret, presence: true

  def self.find_or_create_from_omniauth(params)
    where(uid: params['uid']).first || create_from_omniauth(params)
  end

  def self.create_from_omniauth(params)
    create! do |user|
      user.uid = params['uid']
      user.username = params['info']['nickname']
      user.token = params['credentials']['token']
      user.secret = params['credentials']['secret']
    end
  end
  private_class_method :create_from_omniauth
end
