class SaldoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saldo, only: [:show, :edit, :update, :destroy]

  # GET /saldo/new
  def new
    @bancos = current_user.bancos.order(:nome)
  end

  # POST /saldo
  # POST /saldo.json
  def create
    begin
      data = saldo_params.dig('data')
      bancos = saldo_params.dig('bancos')

      bancos.each do |banco|
        Saldo.create({data: data, banco_id: banco.dig('id'), valor: banco.dig('valor')})
      end
      
      respond_to do |format|
        format.html { redirect_to bancos_path, notice: 'Saldos criados com sucesso.' }
        format.json { render :show, status: :created }
      end
    rescue => exception
      respond_to do |format|
        format.html { redirect_to bancos_path, notice: 'Erro ao criar os saldos.' }
        format.json { render status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saldo
      @saldo = Saldo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saldo_params
      params
    end
end
