class HomeController < ApplicationController
  def index
    @user = User.new
    @trends = Album.trends
    @recent = Album.recently_added
  end
end
