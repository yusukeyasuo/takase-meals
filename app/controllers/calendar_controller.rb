class CalendarController < ApplicationController
  def index
    @orderd = MealOrder.find_by_sql("select DISTINCT COALESCE(sum(member),0)+COALESCE(sum(staff),0)+COALESCE(sum(other),0) as l,COALESCE(sum(small_size),0) as s,CONCAT(SUBSTRING(year,1,4),'-',SUBSTRING(year,5,2),'-',SUBSTRING(year,7,2)) as date from meal_orders group by year");
  end
end
