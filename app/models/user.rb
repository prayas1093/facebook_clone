require 'my_shared_libs/helper_functions'
class User < ApplicationRecord
  include HelperFunctions

  mount_uploader :profile_picture, ProfilePictureUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,omniauth_providers: [:facebook,:twitter]

  validates :first_name, :username, presence: true, length: { maximum: 20 }
  # validates :address,length: { in: 6..50 }
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

    def self.from_omniauth(auth)
      user=User.where(provider: auth.provider, uid: auth.uid).first
      if user.nil?
        if auth.provider=='facebook'
          user=User.new({email: auth.info.email, provider: auth.provider,
                         uid: auth.uid, password: Devise.friendly_token[0,20],
                         first_name: auth.info.name.split(" ")[0],
                         last_name: auth.info.name.split(" ")[1]  
                        })  
          user.username=user.generate_username
        elsif auth.provider=='twitter'
          user=User.new({provider: auth.provider,uid: auth.uid, password: Devise.friendly_token[0,20],
                         first_name: auth.info.name.split(" ")[0],last_name: auth.info.name.split(" ")[1],
                         username: auth.extra.raw_info.screen_name
                        })
          if auth.info.email.nil?
            user.email=user.generate_random_email
          else
            user.email=auth.info.email
          end                                        
          
        end
        user.remote_profile_picture_url=auth.info.image.gsub('http:','https:')
        user.save!
        user.skip_confirmation!
      end
        user   
    end
      


    def generate_random_email
      email=""
      loop do
        email=self.generate_random_string
        email+="@example.com"
        break unless User.exists?(email: email)
      end
      email
    end  

    def generate_username
      username=""
      loop do
        username=self.generate_random_string
        break unless User.exists?(username: username)
      end
      username
    end
    
end
