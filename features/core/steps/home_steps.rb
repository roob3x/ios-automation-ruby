# frozen_string_literal: true

Dado('Que estou na home do app') do
  $logger.info('Inicializando os testes')
  @mycar = HomePage.new
  @mycar.home_page?
end

Quando('Clico em Add') do
    @mycar.click_add_btn
end

Quando('Preencho os dados do veiculo') do |table|
    table.hashes.each do |row|
      @marca = row['marca']
      @modelo = row['modelo']
      @versao = row['versao']
      @ano = row['ano_modelo']
    end
    @mycar.send_keys_marca(@marca)
    @mycar.send_keys_modelo(@modelo)
    @mycar.send_keys_versao(@versao)
    @mycar.send_keys_ano(@ano)
    
end

Quando('Clico em cadastrar') do
    @mycar.click_resgister_btn
end

Entao('Valido que o carro foi cadastrado com sucesso') do
    @mycar.new_car_added?
end