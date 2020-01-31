class TimelineController < ApplicationController
    autocomplete :user, :email, full: true
    before_action :authenticate_user!
    

    def get_timeline
        @post=Post.new
        @posts=current_user.feed
        @page_count = current_user.page_count
    end    


    


   


end
