# encoding: utf-8
desc "Import Tw labor salary"
# http://robots.thoughtbot.com/post/18070048430/anonymizing-customer-company-and-location-data-using
namespace :TwHousePrice do
    task :import => :environment do
      require "pry"
      require "json"
      require "awesome_print"

      def get_date(date_str)
        year = (date_str.to_i / 100 + 1911)
        month =  (date_str.to_i % 100)
        return DateTime.new(year, month, 1)
      end

      TwHousePrice.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!(:tw_house_prices)

      city_map = {
        C: "基隆市",
        A: "臺北市",
        F: "新北市",
        H: "桃園縣",
        O: "新竹市",
        J: "新竹縣",
        K: "苗栗縣",
        B: "臺中市",
        M: "南投縣",
        N: "彰化縣",
        P: "雲林縣",
        I: "嘉義市",
        Q: "嘉義縣",
        D: "臺南市",
        E: "高雄市",
        T: "屏東縣",
        G: "宜蘭縣",
        U: "花蓮縣",
        V: "臺東縣",
        X: "澎湖縣",
        W: "金門縣",
        Z: "連江縣"
      }
      transaction_map ={
        A: "不動產買賣",
        B: "預售屋買賣",
        C: "不動產租賃"
      }

      current_dir = File.dirname(File.absolute_path(__FILE__))

      Dir.glob( current_dir + '/data/*txt') do |fpath|
        fname = File.basename(fpath)
        city = city_map[fname.split('_').first.to_sym]
        transaction_type = transaction_map[fname.split('_lvr_land_').last[0].to_sym]

        open(fpath, 'r').drop(1).each_with_index do |line, i|  
          cells = line.split(',')
          next if cells.count != 26
          begin
            sale_date = get_date(cells[7])
          rescue Exception => e
            p e            
            p line            
            next
          end
          new_record = TwHousePrice.new(
            city: city,
            town: cells[0],
            transaction_type: transaction_type,
            date: sale_date,
            address: cells[2].to_s,
            land_area: cells[3].to_f,
            house_area: cells[15].to_f,
            building_type: cells[11],
            parking_price: cells[25],
            total_price: cells[21].to_f,
          )
          new_record.save!
        end
        
      end

end
end
