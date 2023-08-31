class PagesController < ApplicationController
    def home
    end
    
    def create_entry
      @entry = journal_entries.new(:title, :date, :content)
    end
  end
