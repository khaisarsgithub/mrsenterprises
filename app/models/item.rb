class Item < ApplicationRecord
  has_many :quotation_items, dependent: :destroy
  has_many :quotations, through: :quotation_items
  accepts_nested_attributes_for :quotation_items, allow_destroy: true
end
