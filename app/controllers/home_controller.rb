class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :contact]

  def index
  end

  def about
  end
end
