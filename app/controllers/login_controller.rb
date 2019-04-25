class LoginController < ApplicationController
  def index
  end

  def check
    @login = params[:login]
    @result = Password.find_by(loginid: @login[:exampleInputEmail1])
    if(@result == nil) #データがない
      redirect_to :action => "index"
    else #データがある
      if(@result.loginpass == @login[:exampleInputPassword1]) #passwordが正しい
        cookies[:login] = "ok"
        cookies[:admin] = @result.admin.to_s
        redirect_to :controller => "loginafter", :action => "index"
      end
    end


  end
end
