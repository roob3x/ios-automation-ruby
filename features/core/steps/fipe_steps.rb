require_relative '../../support/env.rb'
include MobileCommons

Quando('clico na sessao fipe') do
    @fipe_page = FipePage.new
    @fipe_page.click_on_fipe_btn
end

Dado('realizo a pesquisa pelo veiculo') do |table|
    step "clico na sessao fipe"
    step "preencho os dados do veiculo na fipe", table
end

Quando('preencho os dados do veiculo na fipe') do |table|
    @dados_veiculo = table.hashes.first
    @fipe_page.click_on_brand_pickle
    @fipe_page.select_brand_fipe(@dados_veiculo['marca'])
    @fipe_page.click_on_model_pickle
    @fipe_page.select_model_fipe(@dados_veiculo['modelo'])
    @fipe_page.click_on_year_pickle
    @fipe_page.select_year_fipe(@dados_veiculo['ano_modelo'])
end

Entao('valido retorno de valor, codigo fipe e valor atual') do
    expect(@fipe_page.get_value_ref_fipe).to eq(get_month.downcase + ' de ' + get_year)
    expect(@fipe_page.get_value_fipe).to_not be_empty
    expect(@fipe_page.get_code_fipe).to_not be_empty
    @code_fipe = @fipe_page.get_code_fipe
    @value_fipe = @fipe_page.get_value_fipe
    @value_ref = @fipe_page.get_value_ref_fipe
end

Quando('altero veiculo para') do |table|
    @fipe_page = FipePage.new
    step "preencho os dados do veiculo na fipe", table
end

Entao('valido que os valores da fipe foram atualizados') do
    expect(@fipe_page.get_value_fipe).to_not be_empty
    expect(@fipe_page.get_code_fipe).to_not be_empty
    expect(@fipe_page.get_value_ref_fipe).to_not be_empty
    expect(@fipe_page.get_value_fipe).to_not eq(@value_fipe)
    expect(@fipe_page.get_code_fipe).to_not eq(@code_fipe)
    expect(@fipe_page.get_value_ref_fipe).to eq(@value_ref)
end