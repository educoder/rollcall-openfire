module RollcallOpenFire
  class Railtie < Rails::Railtie
    config.openfire = ActiveSupport::OrderedOptions.new

    initializer 'openfire.initialize' do |app|
      if config.openfire.domain
        RollcallOpenFire::DOMAIN = config.openfire.domain
      else
        RollcallOpenFire::DOMAIN = 'localhost'
      end
      
      if config.openfire.userservice_url
        RollcallOpenFire::UserServiceUrl = config.openfire.userservice_url
      else
        RollcallOpenFire::UserServiceUrl = "http://#{RollcallOpenFire::DOMAIN}:9090/plugins/accountService/userservice"
      end
      
      if config.openfire.userservice_secret
        RollcallOpenFire::UserServiceSecret = config.openfire.userservice_secret
      else
        raise "You must set a config.openfire.userservice_secret before using the OpenFire plugin."
      end
      
      if config.openfire.group
        RollcallOpenFire::Group = config.openfire.group
      else
        RollcallOpenFire::Group = "rollcall"
      end
      
      require 'account_callbacks'
    end
    
  end
end