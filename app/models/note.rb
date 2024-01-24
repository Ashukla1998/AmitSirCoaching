class Note < ApplicationRecord
    has_one_attached :pdf_file
end
