class SaldosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saldo, only: [:show, :edit, :update, :destroy]

  # GET /saldos
  # GET /saldos.json
  def index
    sql = "select s.data, sum(s.valor) as valor from saldos s group by s.data order by s.data desc"
    @saldos = ActiveRecord::Base.connection.execute(sql).to_a
  end

  # GET /saldos/1
  # GET /saldos/1.json
  def show
  end

  # GET /saldos/new
  def new
    @saldo = Saldo.new
    @saldo.banco = Banco.find(params[:format]) rescue nil
    @saldo.data = Date.today
    @saldo.valor = @saldo.banco.saldos.last.valor rescue nil
  end

  # GET /saldos/1/edit
  def edit
  end

  # POST /saldos
  # POST /saldos.json
  def create
    @saldo = Saldo.new(saldo_params)

    respond_to do |format|
      if @saldo.save
        format.html { redirect_to @saldo.banco, notice: 'Saldo was successfully created.' }
        format.json { render :show, status: :created, location: @saldo }
      else
        format.html { render :new }
        format.json { render json: @saldo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saldos/1
  # PATCH/PUT /saldos/1.json
  def update
    respond_to do |format|
      if @saldo.update(saldo_params)
        format.html { redirect_to @saldo.banco, notice: 'Saldo was successfully updated.' }
        format.json { render :show, status: :ok, location: @saldo }
      else
        format.html { render :edit }
        format.json { render json: @saldo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saldos/1
  # DELETE /saldos/1.json
  def destroy
    @saldo.destroy
    respond_to do |format|
      format.html { redirect_to saldos_url, notice: 'Saldo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saldo
      @saldo = Saldo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saldo_params
      params.require(:saldo).permit(:data, :valor, :banco_id)
    end
end
