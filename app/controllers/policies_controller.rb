class PoliciesController < ApplicationController
  def toc
    current_user.terms_of_service_accepted = true
    current_user.save
    redirect_to marked_location
  end
end
