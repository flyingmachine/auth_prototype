ActionController::Base.class_eval do
  use SessionAssistant::Rack
end

SessionAssistant::RequiredActions.add(:log_in) do |r|
  r.requirements  { logged_in? }
  r.to_perform    { redirect_to new_session_path }
  r.except =      {
    "sessions" => ["new", "create"]
  }
end

SessionAssistant::RequiredActions.add(:require_tos_acceptance) do |r|
  r.preconditions  { logged_in? }
  r.requirements   { current_user.terms_of_service_accepted }
  r.to_perform     { redirect_to url_for(:controller => "policies", :action => "tos") }
  r.except =       {
    "policies" =>  "tos",
    "users"    =>  "reset"
  }
end

SessionAssistant::RequiredActions.add(:redirect_if_password_change_required) do |r|
  r.preconditions  { logged_in? }
  r.requirements   { !current_user.password_change_required }
  r.to_perform     { redirect_to url_for(:controller => "policies", :action => "change_password") }
  r.except =       {
    "policies" =>  "change_password",
    "users"    =>  "reset"
  }
end