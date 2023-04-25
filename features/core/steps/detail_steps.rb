Entao('valido o detalhe do carro') do |table|
    @detail_page = DetailPage.new
    dados_veiculo = table.hashes.first
    expect(@detail_page.get_name_brand).to eq('Marca: ' + dados_veiculo['marca'])
    expect(@detail_page.get_name_model).to eq('Modelo: ' + dados_veiculo['modelo'])
    expect(@detail_page.get_name_version).to eq('Versao: ' + dados_veiculo['versao'])
    expect(@detail_page.get_name_year).to eq('Ano/Modelo: ' + dados_veiculo['ano'])
end