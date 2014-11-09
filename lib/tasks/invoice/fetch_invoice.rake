# encoding: utf-8

desc "Fetch invoice"

namespace :fetch do
  task :invoice => :environment do

    require 'net/http'
    require 'rexml/document'
    require 'pry'
    require 'active_support'
    require 'active_support/all'
    # Web search for "madonna"

    url ='http://invoice.etax.nat.gov.tw/invoice.xml'

    def get_prizes(raw_string)
      prizes_array = raw_string.scan(/(<p>)(.*?)(<\/p>)/i).collect do |data|
        items = data[1].split('：').map(&:strip)
        [items.first, items.last.split('、')]
      end
    end
    # get the XML data as a string
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    hash = Hash.from_xml(xml_data)
    hash["rss"]["channel"]["item"].each do |item|
      invoice_date = Date.parse(item["pubDate"])
      prizes = get_prizes(item["description"])
      new_invoice = Invoice.create(publish_date: invoice_date, prizes: prizes.to_s)
    end

  end
end
