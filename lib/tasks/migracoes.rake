namespace :migracoes do
  desc "Atualizar dividendos"
  task dividendos: :environment do

    puts "Início da migração"
    
    dividendos = Dividendo.all

    dividendos.each do |d|
      d.pago = true;
      d.save
    end

    puts "Fim da Atualização do dividendos"
  end

end
