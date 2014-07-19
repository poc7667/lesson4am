class TwHousePrice < ActiveRecord::Base
  default_scope  do
    exclude_columns = %w(created_at updated_at address)
    filtered_cols = (column_names - exclude_columns.map(&:to_s)).map{|i| "tw_house_prices."+i}
    where("house_area > ?",100)
    .where("land_area > ?",100)
    .where( "total_price > ?",1000000)
    .order('total_price')
    .select(filtered_cols)
  end


  # def following(event_name=self.name)
  #   SonyAlarmLog.joins(:sony_alarm_test)
  #   .where{ name =~ event_name }
  #   .where{ utc_time.gt (my{utc_time} + TIME_CORRECTION) }
  #   .where(sony_alarm_tests: {ip: sony_alarm_test.ip})
  #   .where(sony_alarm_tests: {round: sony_alarm_test.round})
  #   .where(sony_alarm_tests: {firmware_version: sony_alarm_test.firmware_version})
  # end

  def self.cites 
    TwHousePrice.uniq.pluck(:city)
  end
end
