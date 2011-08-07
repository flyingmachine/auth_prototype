class Login
  attr_accessor :controller
  
  def initialize(controller)
    self.controller = controller
  end
  
  def attempt_login
    controller.authenticate
    success
  end
end