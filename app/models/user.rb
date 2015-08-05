class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :bids, dependent: :destroy

  def self.from_auth auth
    find_by( uid: auth.uid, provider: auth.provider ) || self.create_from_auth( auth )
  end

  def self.create_from_auth auth
    create( uid: auth.uid, provider: auth.provider, username: auth.info.nickname )
  end
end
