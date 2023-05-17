ActiveAdmin.register Quotation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  menu priority: 2
  filter :name
  filter :is_bill, label: "Billed"
  permit_params :name, :address, :city, :state, :pincode, :quotation_date, :total_area, :total_units, :is_bill, :total_amt, :s_gst, :c_gst, :grand_total, quotation_items_attributes: [:id, :name, :quantity, :item_id, :quotation_id], items_attributes: [:id, :name, :width, :height, :units, :price]
  
  member_action :download do
    # Custom action logic here
    # param1 = params[:param1]
    # param2 = params[:param2]

    # Call your controller action with parameters
    @quotation = Quotation.find(params[:id])
    puts "In Member action"
    puts @quotation.id, @quotation.name
    
    # PdfController.generate(quotation)
    redirect_to pdf_generate_path(@quotation, quotation: @quotation), notice: 'Quotation Downloaded Successfully.'
    # redirect_to (id), notice: 'Custom action performed successfully.'
  end

  index download_links: [:csv] do
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
    column :is_bill
    column :total_amt
    column "C-GST", :c_gst
    column "S-GST", :s_gst
    column :grand_total
    #actions defaults: false do |quotation|
     # item "View ", admin_quotation_path(quotation)
     # item "Edit ", edit_admin_quotation_path(quotation)
     # item "Delete ", admin_quotation_path(quotation), method: :delete, data: { confirm: 'Are you sure?' }
      # Add your custom actions here...
      # item "Quotation ", pdf_generate_path(quotation), method: :pdf
      # item "Create Bill", bill_bill_path(quotation), method: :post
    #end
    column 'Download' do |resource|
      link_to 'Quotation', download_admin_quotation_path(resource), method: :pdf
    end
    actions
  end


  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :city, :state, :country, :pincode, :quotation_date, :total_area, :total_units, :is_bill, :total_amt, :s_gst, :c_gst, :grand_total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
 
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :city
      f.input :state
      f.input :pincode
      f.input :is_bill
    # end
    # f.inputs 'Quotation Items' do
      f.has_many :quotation_items, heading: 'Items', allow_destroy: true, new_record: 'Add Items' do |qi|
      # qi.input :item, as: :select, collection: Item.all.map { |p| [p.name, p.id] }, include_blank: 'Select Item'
        qi.input :quantity
      # qi.input :_destroy, as: :boolean, required: false, label: 'Remove', wrapper_html: { class: 'remove-item' }
      end
    end
    f.actions
  end
   show do
    attributes_table do
      # row :id
      row :name
      row :address
      row :city
      row :state
      row :pincode
      row :quotation_date
      row :is_bill
      row "Items" do
        panel "Items" do
          table_for quotation.quotation_items do
            column :item
            column :quantity
            column :price
          end
        end
      end
      row :total_area
      row :total_units
      row :total_amt
      row :c_gst
      row :s_gst
      row :grand_total
      # panel "Actions" do
      #  link_to "Download PDF", pdf_generate_path(quotation), method: :post
      # end
    end
  end
end

