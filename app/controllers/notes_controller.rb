class NotesController < ApplicationController
      def new
        @note = Note.new
      end
    
      def create
        @note = Note.new(note_params)
        if @note.save
          redirect_to notes_path, notice: 'Note created successfully.'
        else
          render :new
        end
      end
    
      def index
        @notes = Note.all
      end

      def download
        @note = Note.find(params[:id])
        
        if @note.pdf_file.attached?
          send_data @note.pdf_file.download, filename: @note.pdf_file.filename.to_s, type: @note.pdf_file.content_type
        else
          send_data @note.content, filename: "#{note.title}.txt", type: 'text/plain'
        end
      end

      private
      def note_params
        params.require(:note).permit(:title, :content,:pdf_file)
      end
end
