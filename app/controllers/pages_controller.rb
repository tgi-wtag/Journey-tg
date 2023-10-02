class PagesController < ApplicationController
  def home; end

  def user_home
    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
    end
  end
end
