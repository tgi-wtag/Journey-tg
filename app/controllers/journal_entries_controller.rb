class JournalEntriesController < ApplicationController
  before_action :load_journal_entry, only: [:show, :edit, :update]

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

  def show; end

  def edit; end

  def update
    if @journal_entry.update(entry_params)
      flash[:success] = t('journal_entry.update_success')
      redirect_to journal_entry_path(@journal_entry)
    else
      flash[:error] = t('journal_entry.update_failed')
      render :edit
    end
  end

  private

  def entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end
end
