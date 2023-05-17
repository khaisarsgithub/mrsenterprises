class QuotationItem < ApplicationRecord
  belongs_to :quotation
  belongs_to :item
  # accepts_nested_attributes_for :item, allow_destroy: true

  before_save :update_quotation_items

  validates :quantity, presence: true
  validates :item, presence: true
  validates :quotation, presence: true

  def update_quotation_items
    self.price = self.item.price * self.quantity
  end
end
