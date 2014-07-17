class TwLaborIncome < ActiveRecord::Base
  include Finance

  def self.get_rank_by_income(gender, age, current_income)
    max = get_closest_larger("income", gender, age, current_income)
    min = get_closest_smaller("income", gender, age, current_income)
    delta_x = (max.income - min.income)
    delta_y = (current_income - min.income)

    approximate_rank = min.accumulated_percentage + 
      (delta_y/delta_x)*(max.accumulated_percentage - min.accumulated_percentage)
  end

  def self.get_income_by_rank(gender, age, accumulated_percentage)
    max = get_closest_larger("accumulated_percentage", gender, age, accumulated_percentage)
    min = get_closest_smaller("accumulated_percentage", gender, age, accumulated_percentage)
    approximate_income = min.income +
      (max.income - min.income ) * 
      ((accumulated_percentage-min.accumulated_percentage)/(max.accumulated_percentage-min.accumulated_percentage))
  end

  def self.get_closest_smaller(column_name, gender, age, value)
    where(gender: gender,age: age)
      .where("#{column_name} < ?", value)
      .order("ABS(#{value} - #{column_name})")
      .first    
  end

  def self.get_closest_larger(column_name, gender, age, value)
    where(gender: gender,age: age)
      .where("#{column_name} > ?", value)
      .order("ABS(#{value} - #{column_name})")
      .first    
  end

  def self.load_payment(house_price, loan_duration)
      rate = Rate.new(0.02, :apr, :duration => (loan_duration * 12))
      amortization = Amortization.new(house_price, rate)    
      return -amortization.payment, -amortization.payments.sum
  end

  def get_prediction( user={}, end_age=65, year_weight=14 )
      rank = self.class.get_rank_by_income(user.gender, user.age, user.monthly_income )
      # ret_chart << ["year", "in", "out"]
      (user.age..end_age).map do |age|
        # {name: "#{age.to_s} year" ,data: TwLaborIncome.get_income_by_rank(user.gender, age, rank )}
        # ["#{age} year-old", TwLaborIncome.get_income_by_rank(user.gender, age, rank ), -100]
        ["#{age} 歲", TwLaborIncome.get_income_by_rank(user.gender, age, rank )]
      end
      # binding.pry
      # ret_chart = [{name: "first", data: ret_chart}]
  end  

end
