module Accessible
    extend ActiveSupport::Concern
    included do
      before_action :check_user
    end

    # Custom Authentication Method for Site Navigation Routing
  
    protected
    def check_user
      if admin_signed_in?
        flash.clear
        redirect_to(authenticated_admin_root_path) && return
      elsif current_user
        flash.clear
        redirect_to(authenticated_user_root_path) && return
      end
    end
  end