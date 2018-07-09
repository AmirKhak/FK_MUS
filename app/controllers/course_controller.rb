class CourseController < ApplicationController
  def index
    @course = Course.all;
    @admin = isAdmin;
  end

  def register
    if user_signed_in?
      course_id = params[:course_id];
      user_id = params[:user_id];
      user = User.find(user_id);
      user.course_ids = course_id;
      if user.save
        flash[:notice] = "ثبت نام با موفقیت انجام شد"
      else
        flash[:alert] = "درخواست شما با خطا مواجه شد"
      end
      redirect_to course_index_path
    end
  end

  def create
    if isAdmin
      @course = Course.new(course_params)

      if @course.save
        flash[:notice] = "با موفقیت اضافه شد"
      else
        flash[:alert] = "درخواست شما با خطا مواجه شد"
      end
      redirect_to course_index_path
    end
  end

  def update
    if isAdmin
      @course = Course.find(params[:id])

      if @course.update(course_params)
        flash[:notice] = "تغییر با موفقیت انجام شد"
      else
        flash[:alert] = "درخواست شما با خطا مواجه شد"
      end
      redirect_to course_index_path
    end
  end

  def destroy
    if isAdmin
      course = Course.find(params[:id])
      course.destroy
    end

    redirect_to course_index_path
  end

  private

  def isAdmin
    if user_signed_in?
      if current_user.admin
        return true;
      end
    end
    return false;
  end

  def course_params
    params.require(:course).permit(:name, :description, :price, :capacity, :avatar)
  end
end
