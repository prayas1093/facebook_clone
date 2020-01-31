require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FacebookClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.action_mailer.perform_caching = false
    if  Rails.env=="development"
      config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    else
      config.action_mailer.default_url_options = { host: 'prayas-fb-clone.herokuapp.com'}
    end
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :user_name => '9cfb59a077ed12',
        :password => '03f99c34d712db',
        :address => 'smtp.mailtrap.io',
        :domain => 'smtp.mailtrap.io',
        :port => '2525',
        :authentication => :cram_md5
      }  
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
