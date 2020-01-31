class FollowMapping < ApplicationRecord
    belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
    belongs_to :followee, class_name: 'User', foreign_key: 'followee_id'
    validates :follower_id, uniqueness: { scope: :followee_id }
    before_save :check_user_id


    private

    def check_user_id
        if self.followee_id == self.follower_id 
            raise Error.new "Cannot Follow Yourself"
        end
    end    

end
