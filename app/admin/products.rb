# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :attachedimage, :name, :description, :price, :image, :category_id, product_tags_attributes: %i[id product_id tag_id _destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :image, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Products' do
      f.input :name
      f.input :description
      f.input :price
      f.input :image
      f.input :category_id
      f.has_many :product_tags, allow_destroy: true do |n_f|
        n_f.input :tag
      end
      f.inputs do
        f.input :attachedimage, as: :file
      end
    end
    f.actions
  end
end
