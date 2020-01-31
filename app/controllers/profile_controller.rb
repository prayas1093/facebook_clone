class ProfileController < ApplicationController
    before_action :authenticate_user!


    def show
    end


    def edit
        respond_to do |format|
            format.js { render 'edit_profile_remote.js.erb' }
        end    
    end    

    def update
    end    




end
