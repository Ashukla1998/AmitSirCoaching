
ActiveAdmin.register ContactUs do
    permit_params :name, :email, :number, :message
  
    index do
      selectable_column
      id_column
      column :name
      column :email
      column :number
      column :message
      actions
    end
  
    filter :name
    filter :email
    filter :number
    filter :message
  
    form do |f|
      f.inputs 'Contact Us Details' do
        f.input :name
        f.input :email
        f.input :number
        f.input :message
      end
      f.actions
    end
  end
  