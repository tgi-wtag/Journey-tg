class JournalEntriesController < ApplicationController
    
    def index
        @journal_entries = JournalEntry.all
      end
    
    def entries
      @journal_entries = JournalEntry.all
    end
  
    def new_entry_form
      @journal_entry = JournalEntry.new
    end
  
    def create_entry
      @journal_entry = JournalEntry.new(entry_params)
  
      if @journal_entry.save
        redirect_to journal_entry_path(@journal_entry)
      else
        render :new
      end
    end

    private
    def entry_params
      params.require(:journal_entry).permit(:title, :date, :content)
    end
  end
  