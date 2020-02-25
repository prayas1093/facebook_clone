class ProfileController < ApplicationController
    before_action :authenticate_user!,except: [:check_fields_validity]


    def show
    end


    def edit
        respond_to do |format|
            format.js { render 'edit_profile_remote.js.erb' }
        end    
    end    

    def check_fields_validity
        user=User.new
        case params["fieldName"]
            when 'user_email'
                user.email=params["userInput"]
                unless user.valid?
                    errors_on_field=user.errors.full_messages_for(:email)
                    return render json: {:status=>false,:data=>errors_on_field} if errors_on_field.length>0
                end
            when 'user_username'
                user.username=params["userInput"]
                unless user.valid?
                    errors_on_field=user.errors.full_messages_for(:username)
                    return render json: {:status=>false,:data=>errors_on_field} if errors_on_field.length>0
                end
            when 'user_password'
                user.password=params["userInput"]
                unless user.valid?
                    errors_on_field=user.errors.full_messages_for(:password)
                    return render json: {:status=>false,:data=>errors_on_field} if errors_on_field.length>0
                end
            when 'user_first_name'
                user.first_name=params["userInput"]
                unless user.valid?
                    errors_on_field=user.errors.full_messages_for(:first_name)
                    return render json: {:status=>false,:data=>errors_on_field} if errors_on_field.length>0
                end
            when 'user_last_name'
                user.last_name=params["userInput"]
                unless user.valid?
                    errors_on_field=user.errors.full_messages_for(:last_name)
                    return render json: {:status=>false,:data=>errors_on_field} if errors_on_field.length>0
                end
            when 'user_address'
                user.address=params["userInput"]
                unless user.valid?
                    errors_on_field=user.errors.full_messages_for(:address)
                    return render json: {:status=>false,:data=>errors_on_field} if errors_on_field.length>0
                end
            else
                return render json: {:status=>true}
            end
        return render json: {:status=>true}
    end



    def update
    end    




end
