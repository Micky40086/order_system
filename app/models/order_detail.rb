class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_uniqueness_of :product_id, scope: :order_id
end
