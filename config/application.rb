require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OneTwoThree
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.exception_handler = {
      dev: true, # allows you to turn ExceptionHandler "on" in development
        # This is an entirely NEW structure for the "layouts" area
        # You're able to define layouts, notifications etc ↴
        # All keys interpolated as strings, so you can use symbols, strings or integers where necessary
        exceptions: {
          :all => {
          layout: "exception", # define layout
          notification: true # (false by default)
        # action: ____, (this is general)
        # background: (can define custom background for exceptions layout if required)
          },
          404 => {
            layout: "exception", # define layout
            notification: true # (false by default)
        # action: ____, (this is general)
        # background: (can define custom background for exceptions layout if required)
          },    
          500 => {
            layout: "exception", # define layout
            notification: true # (false by default)
        # action: ____, (this is general)
        # background: (can define custom background for exceptions layout if required)
          }
        }
      }
  end
end
