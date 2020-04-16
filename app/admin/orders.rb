# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order_gst, :order_pst, :order_hst, :order_status, :user_id, :total, :subtotal
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_gst, :order_pst, :order_hst, :order_status, :user_id, :total, :subtotal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
