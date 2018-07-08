class CourseController < ApplicationController
  def index
    @course = Course.all;
    @admin = isAdmin;
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "با موفقیت اضافه شد"
    else
      flash[:alert] = "درخواست شما با خطا مواجه شد"
    end
    redirect_to course_index_path
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      flash[:notice] = "تغییر با موفقیت انجام شد"
    else
      flash[:alert] = "درخواست شما با خطا مواجه شد"
    end
    redirect_to course_index_path
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
    params.require(:course).permit(:answer, :question)
  end
end
