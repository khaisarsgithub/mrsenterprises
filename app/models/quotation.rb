class Quotation < ApplicationRecord
  has_many :quotation_items, dependent: :destroy
  has_many :items, through: :quotation_items
  accepts_nested_attributes_for :quotation_items, allow_destroy: true


  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :pincode, presence: true


  scope :is_bill, -> { where(is_bill: true) }
  before_save :update_quotation

  def update_quotation
    self.quotation_date = DateTime.now
    items = self.quotation_items.includes(:item)
    area = 0
    units = items.length
    price = 0
    items.each do |item|
      area += item.item.width * item.item.height
      # units += item.item.units
      price += item.item.price
    end
    self.total_area = area
    self.total_units = units
    self.total_amt = price
    gst = self.total_amt * 0.09
    self.c_gst = gst
    self.s_gst = gst
    self.grand_total = self.total_amt + gst*2
  end
end
