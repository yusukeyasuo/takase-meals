class OrdereditController < ApplicationController
  def index
    # もしparams[:d]がなかったら、カレンダーから再度実行してください　4～6 正常の場合は8に進む#
    if(params[:d] == nil)
      redirect_to :controller=>:calendar,:action=>:index
      return
    end
     #ハイフンをなくす⇒@date3という変数に入る#
     @data3 = params[:d].split("-")
     #マイナスをとって8桁の数字になる⇒@date1という変数に入る#
     @date1 = @data3[0]+@data3[1]+@data3[2]
     #8桁の数字と年とイコールになる⇒@orderdateという変数に入る#
     @orderdata = MealOrder.where(:year=>@date1)
     #もしオーダーがない、もしくは長さがなかったら（データがない）グループと名前をとり、空欄を渡している #
     if @orderdata == nil || @orderdata.length == 0
       @orderdata = MealOrder.find_by_sql("select @rownum:=@rownum+1 as id,name,`group`,null as `member`,null as`staff`,null as`other`,null as`small_size`,null as`remarks`,null as`year` from (select distinct name,`group` from meal_orders) as a,(SELECT @rownum:=0) AS ROW_NUM_TBL");
     end
     #年月日を@date4に渡している#
     @date4 = @data3[0] + "年" + @data3[1] + "月" + @data3[2] + "日"
      #上記定義を@dateに引き継ぐ#
     @date = params[:d]
  end

  def update
    @data = params[:data];
    @items = params[:items];
    @d = @data[:kikan]
    #期間の中にチェックが入っていたら1でif文に入る、入ってなかったら0#
    if(@d == "1") # 期間
	    if(@data[:day].to_s == "1") #毎日
	      @st = Date.parse(@data[:start])# Date parse ruby型に文字列型の日付を直している #
	      @ed = Date.parse(@data[:end])
	      while(@st<=@ed) do #while文でstがedを過ぎるまで繰り返す #
        #32～62までで数を保存している #
	      @rec = MealOrder.where(:year => @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0"))
	      @rec.delete_all
            stpm.keys.each do |id|
              @rec = MealOrder.find_by(:id=>id,:year => @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0"))
              if @rec == nil
                stpm[id]
                @ff = params[:items][id]
                @rec = MealOrder.new()
                @rec.name=@ff[:name]
                @rec.group=@ff[:group]
                @rec.member=@ff[:member]
                @rec.staff=@ff[:staff]
                @rec.other=@ff[:other]
                @rec.small_size=@ff[:small_size]
                @rec.remarks=@ff[:remarks]
                @rec.year=@st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
  	            @rec.save!
              else
                stpm[id]
                @ff = params[:items][id]
                @rec.name=@ff[:name]
                @rec.group=@ff[:group]
                @rec.member=@ff[:member]
                @rec.staff=@ff[:staff]
                @rec.other=@ff[:other]
                @rec.small_size=@ff[:small_size]
                @rec.remarks=@ff[:remarks]
                @rec.year=@st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
  	            @rec.save!
              end
		    end
		    # 毎日登録のために、1日だけでなく、もう1日足している#
		    @st=@st+1
	      end
	    end
	    if(@data[:syu].to_s == "1") #毎週
	      @st = Date.parse(@data[:start])
	      @ed = Date.parse(@data[:end])
	      while(@st<=@ed) do
	        #wday 0が日曜日、1が月、～と増えていく #
	        if((@st.wday == 0 && @data[:nichi]=="1") || (@st.wday == 1 && @data[:getu]=="1") || (@st.wday == 2 && @data[:ka]=="1") ||
	           (@st.wday == 3 && @data[:sui]=="1")   || (@st.wday == 4 && @data[:moku]=="1") || (@st.wday == 5 && @data[:kin]=="1")||
	           (@st.wday == 6 && @data[:do]=="1"))
      	      @rec = MealOrder.where(:year => @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0"))
	          @rec.delete_all
              stpm.keys.each do |id|

                @rec = MealOrder.find_by(:id=>id,:year => @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0"))
                if @rec == nil
                  stpm[id]
                  @ff = params[:items][id]
                  @rec = MealOrder.new()
                  @rec.name=@ff[:name]
                  @rec.group=@ff[:group]
                  @rec.member=@ff[:member]
                  @rec.staff=@ff[:staff]
                  @rec.other=@ff[:other]
                  @rec.small_size=@ff[:small_size]
                  @rec.remarks=@ff[:remarks]
                  @rec.year=@st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
  	              @rec.save!
                else
                  stpm[id]
                  @ff = params[:items][id]
                  @rec.name=@ff[:name]
                  @rec.group=@ff[:group]
                  @rec.member=@ff[:member]
                  @rec.staff=@ff[:staff]
                  @rec.other=@ff[:other]
                  @rec.small_size=@ff[:small_size]
                  @rec.remarks=@ff[:remarks]
                  @rec.year=@st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
  	              @rec.save!
                end
              end
			end
	        @st=@st+1
	      end
	    end
	    if(@data[:syu1].to_s == "1") #隔週
	      @st = Date.parse(@data[:start])
	      @ed = Date.parse(@data[:end])
	      while(@st<=@ed) do
	        if((@st.wday == 0 && @data[:nichi]=="1") || (@st.wday == 1 && @data[:getu]=="1") || (@st.wday == 2 && @data[:ka]=="1") ||
	           (@st.wday == 3 && @data[:sui]=="1")   || (@st.wday == 4 && @data[:moku]=="1") || (@st.wday == 5 && @data[:kin]=="1")||
	           (@st.wday == 6 && @data[:do]=="1"))

      	      @rec = MealOrder.where(:year => @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0"))
	          @rec.delete_all
              stpm.keys.each do |id|
                @rec = MealOrder.find_by(:id=>id,:year => @st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0"))
                if @rec == nil
                  stpm[id]
                  @ff = params[:items][id]
                  @rec = MealOrder.new()
                  @rec.name=@ff[:name]
                  @rec.group=@ff[:group]
                  @rec.member=@ff[:member]
                  @rec.staff=@ff[:staff]
                  @rec.other=@ff[:other]
                  @rec.small_size=@ff[:small_size]
                  @rec.remarks=@ff[:remarks]
                  @rec.year=@st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
  	              @rec.save!
                else
                  stpm[id]
                  @ff = params[:items][id]
                  @rec.name=@ff[:name]
                  @rec.group=@ff[:group]
                  @rec.member=@ff[:member]
                  @rec.staff=@ff[:staff]
                  @rec.other=@ff[:other]
                  @rec.small_size=@ff[:small_size]
                  @rec.remarks=@ff[:remarks]
                  @rec.year=@st.year.to_s + @st.mon.to_s.rjust(2,"0") + @st.mday.to_s.rjust(2,"0")
  	              @rec.save!
                end
              end
	  	    end
			if(@st.wday == 6) #1週間飛ばし
			  @st = @st + 7.day
			end
			@st=@st+1
	      end
	    end
	   redirect_to "/order/index?d="+@data[:date]
	   return
	 else
	     begin
         @record = MealOrder.find_by_sql("select * from Meal_Orders where year = " + @data[:year])
         @record.delete_all
         rescue => e
         end
         @record = MealOrder.find_by_sql("select * from Meal_Orders where year = " + @data[:year])
         stpm.keys.each do |id|
          @ff = params[:items][id]
          @rec = MealOrder.new()
          @rec.name=@ff[:name]
          @rec.group=@ff[:group]
          @rec.member=@ff[:member]
          @rec.staff=@ff[:staff]
          @rec.other=@ff[:other]
          @rec.small_size=@ff[:small_size]
          @rec.remarks=@ff[:remarks]
          @rec.year=@data[:year]
          @rec.save!
	   end
	   redirect_to "/order/index?d="+@data[:date]
	   return
	 end

  end

  def stpm  #ストロングパラメータ
      params.permit(items: [:name, :group, :member, :staff, :other, :small_size, :remarks])[:items]
  end
end
