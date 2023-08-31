class PagesController < ApplicationController
  def home
  end
    
#   def create_entry
#     @entry = JournalEntry.new(entry_params)

#     # if @entry.save
#     #   redirect_to some_path
#     # else
#     #   render :new
#     # end
#   end

#   private

#   def entry_params
#     params.require(:journal_entry).permit(:title, :date, :content)
#   end
# end

def new_entry_form
  @entry = JournalEntry.new
end

def create_entry
end
end