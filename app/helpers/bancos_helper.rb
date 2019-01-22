module BancosHelper

    def valor_total(banco)
        banco.saldos.sum{|s| s.valor}
    end
end
