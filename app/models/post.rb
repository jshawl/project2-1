class Post < ActiveRecord::Base
  belongs_to :manager
  has_many :bids, dependent: :destroy
  has_many :users, through: :bids
end
