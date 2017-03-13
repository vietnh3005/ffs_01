class Staffs::SessionsController < Devise::SessionsController
  layout "login_layout/login_layout"
  protected
  def after_sign_in_path_for resource
    staff_root_path
  end
end
