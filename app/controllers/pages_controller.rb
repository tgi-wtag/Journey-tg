class PagesController < ApplicationController
  def home
  end
    
  def new_entry
    @entry = JournalEntry.new(entry_params)

    # if @entry.save
    #   redirect_to some_path
    # else
    #   render :new
    # end
  end

  private

  def entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end
end