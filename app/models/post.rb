class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:finders, :slugged]


  belongs_to :user
  has_many :likes
  enum visibility: { public: 1, only_friends: 2, confidential: 3}, _prefix: true

end
