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
      if @journal_entry.save
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

  def show_entry
    @journal_entry = JournalEntry.find(params[:id])
  end
end
