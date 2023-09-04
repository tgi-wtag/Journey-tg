class PagesController < ApplicationController
  def home
  end
    
  def entries
    @journal_entries = JournalEntry.all
  end

  def index 
    @journal_entries = JournalEntry.all
  end
  
  def create_entry
    @journal_entry = JournalEntry.new(entry_params)

    # Handle the entry creation here if needed

  #   # Example:
    if @entry.save
      redirect_to entries_path
    else
      render :new_entry_form
    end
  end

  def new_entry_form
    @journal_entry = JournalEntry.new
  end

  private

  def entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end
end
