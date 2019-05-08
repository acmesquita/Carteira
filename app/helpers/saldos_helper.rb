module SaldosHelper

    def format_date(string)
        Date.parse(string).strftime('%d/%m/%Y') rescue string
    end
end
