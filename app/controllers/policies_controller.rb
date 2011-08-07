class PoliciesController < ApplicationController
  def tos
    if request.post?
      current_user.terms_of_service_accepted = true
      current_user.save
      redirect_to marked_location
    else
      render
    end
  end
  
  def change_password
    if request.post?
      current_user.password_change_required = false
      current_user.save
      redirect_to marked_location
    else
      render
    end
  end
  
end

