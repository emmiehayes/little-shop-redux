require './app/models/merchant.rb'
require './app/models/item.rb'
require 'CSV'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(
                  id:         merchant[:id],
                  name:       merchant[:name],
                  created_at: merchant[:created_at],
                  updated_at: merchant[:updated_at]
                )
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(
              id:           item[:id],
              title:        item[:title],
              description:  item[:description],
              price:        item[:unit_price],
              image:        item[:image],
              created_at:   item[:created_at],
              updated_at:   item[:updated_at]
            )
end
