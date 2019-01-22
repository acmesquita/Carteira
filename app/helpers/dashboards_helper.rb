module DashboardsHelper

    def get_data_labels(banco)
        banco.saldos.sort_by{|s| s.data}.map{|s| s.data.strftime("%d/%m/%y")}.to_set.to_a
    end

    def get_data_values(banco)
        banco.saldos.to_a.map{|s| [s.data, s.valor]}.sort.to_h.values
    end
end
