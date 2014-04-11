class Recording < ActiveRecord::Base
  validates :start_at, :end_at, overlap: { scope: 'user_id' }
  belongs_to :user
end
