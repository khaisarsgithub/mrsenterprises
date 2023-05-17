# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

   content title: "OverView" do
    div div class: "blank_slate_container", id: "dashboard_default_message" do
      columns do
        column do
          panel "Total Quotations" do
            para Quotation.count
          end
        end
        column do
          panel "Total Item" do
            para QuotationItem.count()
          end
        end
        column do
          panel "Total Sales(without GST)" do
            para Quotation.sum(:total_amt)
          end
        end
      end
    end
   end
  end
