class DividendosController < ApplicationController
  before_action :set_dividendo, only: [:show, :edit, :update, :destroy, :pagar]

  # GET /dividendos
  # GET /dividendos.json
  def index
    competencia_atual = params[:dividendo][:competencia] rescue Date.today.strftime("%Y-%m")
    competencia_atual =  Date.today.strftime("%Y-%m") if competencia_atual.nil? || competencia_atual.empty?
    @dividendos = current_user.dividendos.select{|d| d.competencia.strftime("%Y-%m") == competencia_atual}
  end

  # GET /dividendos/1
  # GET /dividendos/1.json
  def show
  end

  # GET /dividendos/new
  def new
    @dividendo = Dividendo.new
    @dividendo.competencia = Date.today
  end
  
  # GET /dividendos/1/edit
  def edit
  end
  
  # POST /dividendos
  # POST /dividendos.json
  def create
    @dividendo = Dividendo.new(dividendo_params)
    @dividendo.competencia = Date.parse(params[:dividendo][:competencia])
    @dividendo.user = current_user
    @dividendo.pago = false

    respond_to do |format|
      if @dividendo.save
        format.html { redirect_to dividendos_path, notice: 'Dividendo was successfully created.' }
        format.json { render :show, status: :created, location: @dividendo }
      else
        format.html { render :new }
        format.json { render json: @dividendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dividendos/1
  # PATCH/PUT /dividendos/1.json
  def update
    respond_to do |format|
      if @dividendo.update(dividendo_params)
        @dividendo.competencia = Date.parse(params[:dividendo][:competencia])
        @dividendo.pago ||= false
        @dividendo.save
        format.html { redirect_to dividendos_path, notice: 'Dividendo was successfully updated.' }
        format.json { render :show, status: :ok, location: @dividendo }
      else
        format.html { render :edit }
        format.json { render json: @dividendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dividendos/1
  # DELETE /dividendos/1.json
  def destroy
    @dividendo.destroy
    respond_to do |format|
      format.html { redirect_to dividendos_url, notice: 'Dividendo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /dividendos/:id/pagar
  def pagar
    @dividendo.pago = true
    respond_to do |format|
      if @dividendo.save()
        format.html { redirect_to dividendos_path, notice: 'Dividendo pago com sucesso.' }
        format.json { render :show, status: :ok, location: @dividendo }
      else
        format.html { render :edit }
        format.json { render json: @dividendo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dividendo
      @dividendo = Dividendo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dividendo_params
      params.require(:dividendo).permit(:competencia, :descricao, :pago, :valor)
    end

end
