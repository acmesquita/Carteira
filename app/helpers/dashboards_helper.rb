module DashboardsHelper

    def get_data_labels_banco(banco)
        banco.saldos.sort_by{|s| s.data}.map{|s| s.data.strftime("%d/%m/%y")}.to_set.to_a
    end

    def get_data_values_banco(banco)
        banco.saldos.to_a.map{|s| [s.data, s.valor]}.sort.to_h.values
    end

    def get_data_labels_user(user)
        user.bancos.map{|b| b.saldos.group_by{|s|s.data}.keys}.flatten.to_set.sort.map{|d| d.strftime("%d/%m/%y")}
    end

    def get_data_values_user(user)
        Saldo.where(:banco=>user.bancos.map{|b|b.id}).sort_by{|s|s.data}.group_by{|s| s.data}.map{|a| a[1].map{|s|s.valor}.sum}
    end

    def data_saldo_atual
        ultimo_dia_saldo.keys.first rescue ""
    end

    def saldo_atual
        ultimo_dia_saldo.values.first rescue 0
    end

    def ultimo_dia_saldo
        sql = "select
                s.data,
                sum(s.valor) as total
               from saldos s
                    inner join bancos b on s.banco_id = b.id
                    inner join users u on b.user_id = u.id
               where u.id = #{current_user.id}
               group by s.data
               order by s.data desc
               limit 1 
            "
        result = ActiveRecord::Base.connection.execute(sql)
        Hash[*result.first.values.to_set.to_a]
    end

    def format_data(string)
        Date.parse(string).strftime('%d/%m/%Y') rescue ""
    end

    def get_data_labels_dividendos(user)
        user.dividendos.sort_by{|d|d.competencia}.group_by{|d|d.competencia}.keys.to_set.map{|k| k.strftime("%m/%Y")}
    end

    def get_data_values_dividendos(user)
        user.dividendos.sort_by{|d|d.competencia}.group_by{|d|d.competencia}.values.map{|d|d.map{|s| s.valor}.sum}
    end

    def gasto_atual()
        competencia_atual = Date.today.strftime("%Y-%m")
        current_user.dividendos.select{|d| d.competencia.strftime("%Y-%m") == competencia_atual}.map{|d| d.valor}.sum
    end

    def get_data_labels_categorias(user)
        user.dividendos.group_by{|d|d.try(:categoria).try(:nome)}.keys.uniq
        # current_user.dividendos.sort_by{|d|d.try(:categoria).try(:nome)}.group_by{|d|d.try(:categoria).try(:nome)}.keys
    end

    def get_data_values_categorias(user)
        user.dividendos.group_by{|d|d.try(:categoria).try(:nome)}.map{ |k| { name: k[0], value: k[1].map{ |s| s.valor }.sum } }.to_json
        # current_user.dividendos.sort_by{ |d| d.try(:categoria).try(:nome) }.group_by{ |d| d.try(:categoria).try(:nome) }.map{ |k| { name: k[0], value: k[1].map{ |s| s.valor }.sum } }.to_json
    end
end
