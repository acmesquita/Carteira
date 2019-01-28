module BancosHelper

    def valor_atual_total(bancos)
        bancos.map{|b| ultimo_valor(b)}.to_a.sum
    end

    def ultimo_valor(banco)
        banco.saldos.sort_by{|s| s.data}.last.valor rescue 0
    end
end
