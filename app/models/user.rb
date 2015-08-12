class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  # nice use of validation here!
  # you will want to set the scope for this validation.
  # e.g. what if there is a jshawl on twitter, but a different jshawl on facebook?
  # http://guides.rubyonrails.org/active_record_validations.html#uniqueness
  has_many :bids, dependent: :destroy

  def self.from_auth auth
    find_by( uid: auth.uid, provider: auth.provider ) || self.create_from_auth( auth )
  end

  def self.create_from_auth auth
    create( uid: auth.uid, provider: auth.provider, username: auth.info.name )
  end
  # excellent!!!! use of model methods!
end
