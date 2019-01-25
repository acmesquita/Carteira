module DividendosHelper

    def valor_total(dividendos)
        dividendos.map{|d| d.valor}.sum rescue 0
    end

    def valor_total_pago(dividendos)
        dividendos.select{|d| d.pago }.map{|d| d.valor}.sum rescue 0
    end
end
