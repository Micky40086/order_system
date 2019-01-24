class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, inverse_of: :order, dependent: :destroy
  accepts_nested_attributes_for :order_details, reject_if: :all_blank, allow_destroy: true
  has_many :products, through: :order_details

  after_create :set_default_order_detail
  
  def set_default_order_detail
    Product.all.each do |product|
      self.order_details.create(:product_id => product.id)
    end
  end
end
