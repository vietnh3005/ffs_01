module DiscountsHelper

  def display_status
    if order.wating?
      image_tag "wating.png", size: "#{Settings.weight}x#{Settings.height}"
    elsif order.accepted?
      image_tag "accepted.png", size: "#{Settings.weight}x#{Settings.height}"
    elsif  order.rejected?
      image_tag "rejected.png", size: "#{Settings.weight}x#{Settings.height}"
    elsif order.finished?
      image_tag "finished.png", size: "#{Settings.weight}x#{Settings.height}"
  end
end
