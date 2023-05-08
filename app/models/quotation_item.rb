class QuotationItem < ApplicationRecord
  belongs_to :quotation
  belongs_to :item

  before_save :update_quotation_items

  validates :item, presence: true
  validates :quotation, presence: true

  def update_quotation_items
    self.price = self.item.price * self.quantity
  end
end
