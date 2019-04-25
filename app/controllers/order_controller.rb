class OrderController < ApplicationController
  def index
    # もしparams[:d]がなかったら、カレンダーから再度実行してください　4～6 正常の場合は7に進む#
    if(params[:d] == nil)
      redirect_to :controller=>:calendar,:action=>:index
    end
    #ハイフンをなくす⇒@date3という変数に入る#
    @d = params[:d].split("-")
    @date3 = @d[0]+@d[1]+@d[2]
    #小サイズ、大サイズの合計を出す#
    @orderdata = MealOrder.find_by_sql("select a.id,a.name,a.year,COALESCE(sum(member),0)+COALESCE(sum(staff),0)+COALESCE(sum(other),0) as large_size,COALESCE(sum(small_size),0) as small_size from meal_orders as a where (a.year =" + @date3 + ") group by name order by id")
    #もしオーダーがない、もしくは長さがなかったら（データがない）部署名だけとり、大サイズ、小サイズは空欄を渡している#
    if @orderdata ==nil || @orderdata.length == 0
      @orderdata = MealOrder.find_by_sql("select distinct name,null as large_size,null as small_size from meal_orders order by id");
    end
    #年月日を@dateに渡している#
    @date = @d[0] + "年" + @d[1] + "月" + @d[2] + "日"
    #上記定義を@date2に引き継ぐ#
    @date2 = params[:d]

  end

  def delete
    if(params[:d] == nil)
      redirect_to :controller=>:calendar,:action=>:index
    end
    @date = params[:d]
    for @num in 0..100 do
      @d1 = params["q"+@num.to_s];
      if @d1 == nil
        next
      end
      @d = params[:d].split("-")
      @rec = MealOrder.find_by(:name=>@d1,:year=>@d[0]+@d[1]+@d[2])
      if @rec == nil
        next
      end
      @rec.update_attributes(:member=>nil,:staff=>nil,:other=>nil,:small_size=>nil,:remarks=>nil)
    end
    redirect_to "/order/index/?d="+@date
  end

end
