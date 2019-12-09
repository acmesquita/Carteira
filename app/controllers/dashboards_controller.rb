class DashboardsController < ApplicationController
  before_action :authenticate_user! 
  # GET /dashboards
  # GET /dashboards.json
  def index
    @bancos = current_user.bancos.order(:nome)
  end
end
