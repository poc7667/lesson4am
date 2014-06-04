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
* city
* town
* transaction_type
* target_type
* date
* address
* land_area
* house_area
* building_type
* parking_price
* total_price
* other_information

		rails g model TwHousePrice city:string town:string transaction_type:string target_type:string date:date address:string land_area:float house_area:float building_type:string parking_price:float total_price:float other_information:hstore


# Scaffold
## BuyHouse

* rails g scaffold BuyHouse user_id:integer age:integer gender:string monthly_income:float job:text expenditure:hstore


## model

find the closet value

* sensor.histories.order("ABS(time_stamp - #{params[:time_stamp].to_i})").first
* LaborIncome.where(age:28, gender: "male").order("ABS(50000 - income)").select('percentage')