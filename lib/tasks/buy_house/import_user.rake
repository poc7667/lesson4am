# encoding: utf-8
desc "Import Tw labor salary"
# http://robots.thoughtbot.com/post/18070048430/anonymizing-customer-company-and-location-data-using
namespace :TwLaborIncome do
    task :import => :environment do
      require "pry"
      require "json"
      require "awesome_print"

      TwLaborIncome.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!(:tw_labor_incomes)

      salary_mapping =[
        15000,
        17500,
        22500,
        27500,
        32500,
        37500,
        42500,
        47500,
        55000,
        65000,
        75000
      ]

      def get_age_range(age)
          age = age.scan(/\d{2}/).collect!{|x| x.to_i}
          if 1== age.length
            age_start, age_end = age.first, 99
          else
            age_start, age_end = age.first, age.last
          end
          return age_start, age_end
      end

      im_data = JSON.parse( IO.read "./lib/tasks/buy_house/export.json" ,:symbolize_names => true)

      ["male", "female"].each do |gender|

        im_data[gender].each do | item |

          age_start, age_end = get_age_range(item.first)

          (age_start..age_end).each do |age|

            accumulated_percentage = 0

            item.last.each_with_index do  |percentage, i|

              percentage = percentage.to_f
              accumulated_percentage += percentage
              income = salary_mapping[i]

              new_record = TwLaborIncome.create(
                year: 2013,
                age: age,
                income: income,
                percentage: percentage,
                accumulated_percentage: accumulated_percentage,
                gender: gender
                )
            end
          end
        end
      end



end
end
