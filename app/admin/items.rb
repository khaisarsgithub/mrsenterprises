ActiveAdmin.register Quotation, as: "Billing" do

  # menu priority: 3
  menu false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  
   permit_params :name, :address, :city, :state, :pincode, :quotation_date, :total_area, :total_units, :is_bill, :total_amt, :s_gst, :c_gst, :grand_total
  controller do
    def scoped_collection
      # Customize the query based on your requirements
      super.where(is_bill: true)
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :city
    column :state
    column :pincode
    column :quotation_date
    column :total_area
    column :total_units
    column :total_amt
    column :s_gst
    column :c_gst
    column :grand_total
    column :created_at
    column :updated_at
    # actions defaults: false do |cart_item|
    #   item "New Cart Item", new_admin_quotation_item_path(quotations_id: cart_item.id)
    # end
  end
  # scope :is_bill, default: true, label: 'Bills'
  # or
  #
  # permit_params do
  #   permitted = [:width, :height, :price, :units]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
