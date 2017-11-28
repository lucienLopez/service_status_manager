class ServicesController < ApplicationController
  def index
    @services = Service.order(:name)
  end
end
