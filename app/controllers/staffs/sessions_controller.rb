class Staffs::SessionsController < Devise::SessionsController
  layout "staffs_layout/staffs_layout"
  protected
  def after_sign_in_path_for resource
    staff_root_path
  end
end
