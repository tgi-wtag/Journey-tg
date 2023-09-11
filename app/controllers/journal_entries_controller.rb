class JournalEntriesController < ApplicationController
    
    def index
        @journal_entries = JournalEntry.all
    end
  
    def new
      @journal_entry = JournalEntry.new
    end
  
    def create
      @journal_entry = JournalEntry.new(entry_params)
  
      if @journal_entry.save
        if @journal_entry.title.present?
          redirect_to journal_entry_path(@journal_entry)
        else
          flash[:error] = "Title is required."
        end
      else
        flash[:error] = "There was an error creating the journal entry."
        render :new
      end


    end

    private
    
    def entry_params
      params.require(:journal_entry).permit(:title, :date, :content)
    end
  end
  