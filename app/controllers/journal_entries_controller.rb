class JournalEntriesController < ApplicationController
  def index
    @journal_entries = JournalEntry.all
  end

  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = current_user.journal_entries.new(journal_entry_params)
  
    if @journal_entry.save
      redirect_to user_journal_entry_path(current_user, @journal_entry)
    else
      flash[:error] = t('errors.creating_failed')
      render :new
    end
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file_name', template: 'layouts/template_pdf'
      end
    end
  end

  def edit
    @journal_entry = JournalEntry.find(params[:id])
  end

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
end

