ActiveAdmin.register User do
  permit_params :first_name, :birth_date, :email, :address, :city, :country, :zipcode, :mood, :picture

    form do |f|
      f.inputs "User" do
        f.input :first_name
        f.input :birth_date
        f.input :email
        f.input :address
        f.input :city
        f.input :country
        f.input :zipcode
        f.input :mood
        f.input :picture
      end
      f.actions
    end

    index do
        selectable_column
        column :id
        column :first_name
        column :birth_date
        column :email
        column :address
        column :city
        column :country
        column :zipcode
        column :mood
        column :picture
        column :created_at
        column :admin
        actions
      end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
