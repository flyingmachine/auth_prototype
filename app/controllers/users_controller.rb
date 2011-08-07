class UsersController < ApplicationController
  def reset
    current_user.terms_of_service_accepted = false
    current_user.password_change_required = true
    current_user.save
    redirect_to quotes_path
  end
end
