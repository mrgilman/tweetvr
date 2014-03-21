class HomeController < ApplicationController
  skip_before_filter :authorize

  def show
  end
end
