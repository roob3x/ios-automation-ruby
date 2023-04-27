require_relative '../../support/env.rb'
include MobileCommons

Quando('clico na sessao fipe') do
    @fipe_page = FipePage.new
    @fipe_page.click_on_fipe_btn
end

Quando('preencho os dados do veiculo na fipe') do |table|
    dados_veiculo = table.hashes.first
    @fipe_page.click_on_brand_pickle
    @fipe_page.select_brand_fipe(dados_veiculo['marca'])
    @fipe_page.click_on_model_pickle
    @fipe_page.select_model_fipe(dados_veiculo['modelo'])
    @fipe_page.click_on_year_pickle
    @fipe_page.select_year_fipe(dados_veiculo['ano_modelo'])
end

Entao('valido retorno de valor para o mes atual') do
    expect(@fipe_page.get_value_ref_fipe).to eq('Mes de referencia: , ' + get_month.downcase + ' de ' + get_year)
end