module ControllerMacros
  def buyer_sign_in(buyer)
    sign_in(:buyer, buyer)
  end
  private
  def log_in(kind, user)
    @request.env["devise.mapping"] = Devise.mappings[kind]
    sign_in user
  end
end
