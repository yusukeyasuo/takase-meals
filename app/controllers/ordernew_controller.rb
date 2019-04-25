class OrdernewController < ApplicationController
  def index
    if(params[:d] == nil)
      redirect_to :controller=>:calendar,:action=>:index
    end
    @d = params[:d]
  end
  
  def update
    if(params[:data] == nil)
      redirect_to :controller=>:calendar,:action=>:index
    end
    @st = Date.today
    @data = params[:data]
    for @num in 0..100 do
      if @data["name"+@num.to_s] == nil
        break
      end
      @d = MealOrder.new(params.require(:data).permit("name", "group","year"))
      @d.name=@data["name"+@num.to_s]
      @d.group=@data["group"+@num.to_s]
      @d.year= @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
      @d.save!
    end
    redirect_to "/order/index?d="+@data[:d]
  end
end
