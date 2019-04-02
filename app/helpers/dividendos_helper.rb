module DividendosHelper

    def valor_total(dividendos)
        dividendos.map{|d| d.valor}.sum rescue 0
    end

    def valor_total_pago(dividendos)
        dividendos.select{|d| d.pago }.map{|d| d.valor}.sum rescue 0
    end

    def media_de_gastos
        dividendos = current_user.dividendos
        total = dividendos.map{|d|d.valor}.sum 
        meses = dividendos.map{|d|d.competencia.strftime("%m/%Y") }.to_set.count
        total / meses rescue 0
    end
end
