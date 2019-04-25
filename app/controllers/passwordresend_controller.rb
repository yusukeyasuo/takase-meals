class PasswordresendController < ApplicationController
  def index
  end
  
  def sousin
    @mail = params[:form]
    MailformMailer.message_send(@mail).deliver
    redirect_to :controller=>:complete,:action=>:index
  end
  
end
