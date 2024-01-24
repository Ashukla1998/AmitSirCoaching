ActiveAdmin.register Note do
    permit_params :title, :content, :pdf_file
  
    index do
        selectable_column
        id_column
        column :title
        column :content
        column 'PDF File' do |note|
          link_to 'Download PDF', url_for(note.pdf_file), target: '_blank' if note.pdf_file.attached?
        end
        actions
    end

    show do
        attributes_table do
          row :id
          row :title
          row :content
          row 'PDF File' do |note|
            if note.pdf_file.attached?
              link_to 'Download PDF', url_for(note.pdf_file), target: '_blank'
            else
              'No PDF file attached'
            end
          end
        end
      end
  
    filter :title
    filter :content
  
    form do |f|
      f.inputs 'Note Details' do
        f.input :title
        f.input :content, as: :quill_editor
        f.input :pdf_file, as: :file
      end
      f.actions
    end
  end