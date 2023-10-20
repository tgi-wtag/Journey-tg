class JournalEntriesController < ApplicationController
  def index
    @journal_entries = JournalEntry.all
  end

  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = JournalEntry.new(entry_params)
    @journal_entry.user_id = current_user.id

    if @journal_entry.save
      if @journal_entry.title.present?
        redirect_to journal_entry_path(@journal_entry)
      else
        flash[:error] = t('errors.no_title')
      end
    else
      flash[:error] = t('errors.creating_failed')
      render :new
    end
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])
  end

  private

  def entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end
end
