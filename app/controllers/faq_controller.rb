class FaqController < ApplicationController
  def index
    @faq = Faq.all;
    @admin = isAdmin;
  end

  def create
    @faq = Faq.new(faq_params)

    if @faq.save
      flash[:notice] = "سوال با موفقیت اضافه شد"
    else
      flash[:alert] = "درخواست شما با خطا مواجه شد"
    end
    redirect_to faq_index_path
  end

  def update
    @faq = Faq.find(params[:id])

    if @faq.update(faq_params)
      flash[:notice] = "تغییر با موفقیت انجام شد"
    else
      flash[:alert] = "درخواست شما با خطا مواجه شد"
    end
    redirect_to faq_index_path
  end

  def destroy
    if isAdmin
      faq = Faq.find(params[:id])
      faq.destroy
    end

    redirect_to faq_index_path
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

  def faq_params
    params.require(:faq).permit(:answer, :question)
  end
end
