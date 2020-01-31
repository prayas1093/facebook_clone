class LikeController < ApplicationController
    before_action :authenticate_user!


    def like_post_remote
        @post_id = params[:post_id]
        like = current_user.likes.where(post_id: @post_id).first
        if like
          like.destroy
        else
          like = current_user.likes.create(post_id: @post_id)
        end
        
        respond_to do |format|
            format.js
        end    




    end



end
