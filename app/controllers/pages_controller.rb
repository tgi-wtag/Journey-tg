class PagesController < ApplicationController
    def home
    end
    
    def create_entry
      @entry = JournalEntry.new
      # You might also want to initialize any associated objects here (e.g., tasks, goals)
    end
  end
