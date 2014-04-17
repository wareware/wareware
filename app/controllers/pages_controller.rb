class PagesController < ApplicationController
  def index
    flash[:notice] = 'test notification' if request.method == 'POST'
    flash[:alert] = 'test alert' if request.method == 'POST'
  end
end
