class Staffs::SessionsController < Devise::SessionsController
  layout "staffs_layout"
  protected
  def after_sign_in_path_for resource
    if resource.admin? || resource.owner?
      admin_orders_path
    elsif resource.chef?
      admin_chef_order_path
    elsif resource.shipper?
      admin_shipper_order_path
    end
  end
end
