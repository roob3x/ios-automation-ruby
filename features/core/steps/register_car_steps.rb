# frozen_string_literal: true

Quando('Preencho os dados do veiculo') do |table|
    @register_page = RegisterCarPage.new
    table.hashes.each do |row|
      @marca = row['marca']
      @modelo = row['modelo']
      @versao = row['versao']
      @ano = row['ano_modelo']
    end
    @register_page.send_keys_marca(@marca)
    @register_page.send_keys_modelo(@modelo)
    @register_page.send_keys_versao(@versao)
    @register_page.send_keys_ano(@ano)
    
end

Quando('Clico em cadastrar') do
    @register_page.click_resgister_btn
end
