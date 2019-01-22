module BancosHelper

    def valor_total(banco)
        banco.saldos.sum{|s| s.valor}
    end

    def ultimo_valor(banco)
        banco.saldos.sort_by{|s| s.data}.last.valor rescue 0
    end
end
