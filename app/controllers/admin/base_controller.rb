class Admin::BaseController < ApplicationController
  before_action :admin_only
  layout 'admin'

  def admin_only
    authenticate_user!
    redirect_to root_url if !current_user.admin?
  end
end
