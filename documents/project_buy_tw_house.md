# Description
To calculate your future life after buying a house in Taiwan.
# Models

## TwLaborIncome (tw_labor_income)
* year
* gender
* age
* percentage
* income

## TwHousePrice (tw_house_price)
* City
* Saled_at
* 


# Scaffold
## BuyHouse

* rails g scaffold BuyHouse user_id:integer age:integer gender:string monthly_income:float job:text expenditure:hstore


## model

find the closet value

* sensor.histories.order("ABS(time_stamp - #{params[:time_stamp].to_i})").first
* LaborIncome.where(age:28, gender: "male").order("ABS(50000 - income)").select('percentage')