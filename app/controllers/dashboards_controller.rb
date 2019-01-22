class DashboardsController < ApplicationController
 
  # GET /dashboards
  # GET /dashboards.json
  def index
    @bancos = Banco.all
  end

 
end
