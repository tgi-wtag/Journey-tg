class PagesController < ApplicationController
  def home
  end
    
  def index 
    @journal_entry = JournalEntry.all
  end

  def new_entry_form
    @entry = JournalEntry.new
  end

  def create_entry
    @entry = JournalEntry.new(entry_params)
    if @entry.save
      redirect_to entries_path
    else
      render :new_entry_form
    end
  end

  private
  def entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end
end
