class ProfileController < ApplicationController
    before_action :authenticate_user!,except: [:check_username]


    def show
    end


    def edit
        puts "Prayas Arora ABCDEF"
        respond_to do |format|
            format.js { render 'edit_profile_remote.js.erb' }
        end    
    end    

    def check_username
        return render json: {:status=>false,:message=>"Username already taken."} if User.exists?(username: params[:username].downcase)
        return render json: {:status=>true}
    end


    def update
    end    




end
