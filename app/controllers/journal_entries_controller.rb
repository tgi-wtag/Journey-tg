class JournalEntriesController < ApplicationController
  before_action :find_entry, only: %i[show edit update] 
  def index
    @journal_entries = JournalEntry.all
  end

  def new
    @journal_entry = current_user.journal_entries.new
  end

  def create
    @journal_entry = current_user.journal_entries.new(journal_entry_params)
  
    if @journal_entry.save
      redirect_to user_journal_entries_path
    else
      flash[:error] = t('errors.creating_failed')
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file_name', template: 'layouts/template_pdf'
      end
    end
  end

  def edit; end

  def update
    if @journal_entry.update(journal_entry_params)
      flash[:success] = t('journal_entry.update_success')
      redirect_to user_journal_entry_path(current_user, @journal_entry)
    else
      flash[:error] = t('journal_entry.update_failed')
      render :edit
    end
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:title, :date, :content)
  end

  def find_entry
    @user = current_user
    @journal_entry = @user.journal_entries.find(params[:id])
  end
end
