class UserController < ApplicationController

  before_action :authenticate_user!

  def index
    @admin = false
    if user_signed_in?
      if current_user.admin
        @users = User.all;
        @admin = true;
      end
    end
  end

  def edit
    user = User.find(params[:id]);
    admin = true;
    if user_signed_in?
      if current_user.admin
        if user.admin
          admin = false;
        end
        user.admin = admin;
        user.save;
      end
    end
    redirect_to user_index_path;
  end

  def destroy
    if user_signed_in?
      if current_user.admin
        User.find(params[:id]).destroy;
      end
    end
    redirect_to user_index_path;
  end

end
