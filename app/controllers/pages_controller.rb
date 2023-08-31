class PagesController < ApplicationController
  def home
  end
    
  def index 
    @journal_entry = Journal_entry.all
  end
  def create_entry
    @entry = JournalEntry.new(entry_params)

    # Handle the entry creation here if needed

  #   # Example:
    if @entry.save
      redirect_to entries_path
    else
      render :new_entry_form
    end
  end

  def new_entry_form
    @entry = JournalEntry.new
  end

  private

  def entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end
end
