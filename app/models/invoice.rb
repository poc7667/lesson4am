class Invoice < ActiveRecord::Base
  def to_publish_date
    first_month=publish_date-2.month
    second_month=publish_date-1.month
    "#{first_month.year}-#{first_month.month.to_s}-#{second_month.month.to_s}"
  end
end
