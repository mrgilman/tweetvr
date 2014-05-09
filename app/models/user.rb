class User < ActiveRecord::Base
  validates :uid, presence: true, uniqueness: true
  validates :username, presence: true
  validates :token, presence: true
  validates :secret, presence: true

  has_many :recordings

  before_create :generate_remember_token

  def self.find_or_create_from_omniauth(params)
    where(uid: params['uid']).first || create_from_omniauth(params)
  end

  def self.create_from_omniauth(params)
    create! do |user|
      user.uid = params['uid']
      user.username = params['info']['nickname']
      user.image_url = params['info']['image']
      user.token = params['credentials']['token']
      user.secret = params['credentials']['secret']
    end
  end
  private_class_method :create_from_omniauth

  private

  def generate_remember_token
    self.remember_token = SecureRandom.hex
    while User.where(remember_token: self.remember_token).exists?
      self.remember_token = SecureRandom.hex
    end
  end
end
