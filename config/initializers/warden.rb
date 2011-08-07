Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :skip_password, :password
  manager.failure_app = SessionsController
end

# Setup Session Serialization
class Warden::SessionSerializer
  def serialize(record)
    [record.class, record.id]
  end

  def deserialize(keys)
    klass, id = keys
    klass.find(:first, :conditions => { :id => id })
  end
end

Warden::Strategies.add(:skip_password) do
  def valid?
    params[:skip_password] && env["action_controller.instance"].current_user
  end
  
  def authenticate!
    u = User.find_by_login_id(params[:login_id])
    u.nil? ? fail!("User not found") : success!(u)
  end
end

# Declare your strategies here
Warden::Strategies.add(:password) do
  def valid?
    params[:login_id] ||= params[:email] #alumni uses 'email'
    params[:login_id] || params[:password]
  end
  
  def authenticate!
    u = User.find_by_login_id_and_password(params[:login_id], params[:password])
    u.nil? ? fail!("We could not log you in with that username andpassword.") : success!(u)
  end
end