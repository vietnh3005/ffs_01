class Staffs::PagesController < ApplicationController
  layout "staffs_layout/staffs_layout"
  def show
    if valid_page?
      render template: "staffs/pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new Rails.root + "app/views/staffs/pages/#{params[:page]}.html.erb"
  end
end
