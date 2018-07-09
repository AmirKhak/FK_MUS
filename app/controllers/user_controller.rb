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

  def courses
    @isRealUser = isRealUser(params[:id]);
    if @isRealUser
      user = User.find(params[:id]);
      @courses = user.course_ids;

    end
  end

  def removeCourse
    @isRealUser = isRealUser(params[:user_id]);
    if @isRealUser
      user = User.find(params[:user_id]);
      if user.course_ids.delete(params[:course_id].to_i)
        user.save;
        flash[:notice] = "با موفقیت حذف شد"
      else
        flash[:alert] = "درخواست شما با خطا مواجه شد"
      end
      redirect_to root_path;
    end
  end

  private

  def isRealUser(user_id)
    realUser = false;
    if user_signed_in?
      if current_user.id == user_id.to_i
        realUser = true;
      end
    end
    return realUser;
  end

end
