class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id,
                        :status      
                
  has_many :invoice_items
  belongs_to :merchant
end