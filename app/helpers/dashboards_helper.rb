module DashboardsHelper

    def get_data_labels_banco(banco)
        banco.saldos.sort_by{|s| s.data}.map{|s| s.data.strftime("%d/%m/%y")}.to_set.to_a
    end

    def get_data_values_banco(banco)
        banco.saldos.to_a.map{|s| [s.data, s.valor]}.sort.to_h.values
    end

    def get_data_labels_user(user)
        Saldo.all.group_by{|s|s.data}.map{|d| d[0].strftime("%d/%m/%y")}
    end

    def get_data_values_user(user)
        Saldo.all.group_by{|s|s.data}.map{|d| d[1].map{|a|a.valor}.sum}
    end

    def data_saldo_atual
        ultimo_dia_saldo.keys.first
    end

    def saldo_atual
        ultimo_dia_saldo.values.first
    end

    def ultimo_dia_saldo
        sql = "select
                s.data,
                sum(s.valor) as total
               from saldos s
               group by s.data
               order by s.data desc
               limit 1 
            "
        result = ActiveRecord::Base.connection.execute(sql)
        Hash[*result.first.values.to_set.to_a]
    end

    def format_data(string)
        Date.parse(string).strftime('%d/%m/%Y')
    end
end
