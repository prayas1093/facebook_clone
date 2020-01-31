class FollowController < ApplicationController
    before_action :authenticate_user!




    def get_all_users
        @users=User.where('users.id!=(?)',current_user.id).joins(:follower_mappings).select("users.username,users.id as user_id,COUNT(follow_mappings.follower_id) as followers_count").group("users.id").order('followers_count DESC')
        @current_user_followees=current_user.followees.pluck(:id)
    end   


    def follow
        @followee_id=params[:followee_id]
        follow_mapping=FollowMapping.where(follower_id: current_user.id, followee_id: @followee_id).first
        unless follow_mapping
            follow_mapping=FollowMapping.new(followee_id: @followee_id, follower_id: current_user.id)
            if follow_mapping.save
                respond_to :js
            else
                respond_to :js, flash.now[:alert] = "#{follow_mapping.errors.full_messages}"
            end        
        else    
            follow_mapping.destroy
            respond_to :js
        end



        # begin
        #    if save
        #    else
        #     raise Excepetion.new("")
        #    end 
        # rescue => exception
        #     @error = ""
        # end

    end



end
