class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_user



  protected

  def find_user
    @user = User.find_or_create_by(:name => remote_hostname.gsub('.adb.ua', ''))
  end





  def remote_hostname
    require 'resolv'
    Resolv.getname(request.remote_ip)
  end

end
