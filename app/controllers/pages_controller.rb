class PagesController < ApplicationController
    def home
    end
    
    def create_entry
      @entry = journal_entries.new
    end
  end
