require 'rest_client'
require 'uri'
require 'account'

Account.class_eval do
  include OpenFireUserService
  
  before_validation :create_account_in_openfire, :on => :create
  before_validation :update_account_in_openfire, :on => :update
  before_destroy :delete_account_in_openfire
  
  validate do
    self.errors[:base] << @openfire_error if @openfire_error
  end
end