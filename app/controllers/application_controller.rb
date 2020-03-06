class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?


protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, addresses_attributes: [:country, :city, :address_line_1, :address_line_2 , :postal_code]])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
end



end
