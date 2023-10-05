class PagesController < ApplicationController
  def user_home
    if current_user.blank?
      render plain: t('errors.e401'), status: :unauthorized
    end
  end
end
