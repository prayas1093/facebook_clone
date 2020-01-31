class PostController < ApplicationController
    before_action :authenticate_user!


    

    def create_post_remote
        @post=current_user.posts.create(post_params)
        respond_to do |format|
            format.js { render 'create_post_remote.js.erb' }
        end    
    end    

    def edit
    end
    
    def update
    end    


    def show
    end
    
    
    def destroy
    end


    private

    def post_params
        params.require(:post).permit(:title,:description)
    end





end
