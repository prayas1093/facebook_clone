class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable

  validates :first_name, :last_name, :username, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { in: 6..50 }
  validates :email, :username, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower_mappings, class_name: :FollowMapping, foreign_key: :followee_id
  has_many :followers, through: :follower_mappings
  has_many :followee_mappings , class_name: :FollowMapping, foreign_key: :follower_id
  has_many :followees, through: :followee_mappings
  

    def funky_method
      "#{self.email}.camelize"
    end  


    def feed page_number: 0
      feed_total.limit(Constants::POST_PAGE_COUNT).offset(Constants::POST_PAGE_COUNT * page_number)
    end  

    def feed_total
      users=followees.pluck(:id)+[self.id]
      feed_posts = Post.includes(:user,:likes).where("user_id in (?)",users).order('created_at DESC')
    end

    def page_count
      feed_total.count/Constants::POST_PAGE_COUNT
    end  






  
end
