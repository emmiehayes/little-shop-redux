class Item < ActiveRecord::Base
  validates_presence_of :title,
                        :description,
                        :price,
                        :merchant_id,
                        :image

  has_many :invoice_items
  belongs_to :merchant

  def self.total_item_count
    count
  end

  def self.average_unit_price
    average(:price)
  end

  def self.newest
    order(created_at: :asc).last
  end

  def self.oldest
    order(created_at: :asc).first
  end
end
