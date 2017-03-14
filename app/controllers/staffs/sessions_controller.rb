class Staffs::SessionsController < Devise::SessionsController
  layout "staffs_layout/staffs_layout"
  protected
  def after_sign_in_path_for resource
    admin_orders_path
  end
end
