module ProductsHelper
  def default_image product
    if product.image.blank?
      image_tag "default.jpg"
    else
      image_tag product.image.url
    end
  end
end
