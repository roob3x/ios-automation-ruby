# frozen_string_literal: true

Dado('Que estou na home do app') do
  $logger.info('Inicializando os testes')
  @home = HomePage.new
  @home.home_page?
end

Quando('Clico em Add') do
    @home.click_add_btn
end

Quando('Apago todos os carros da lista') do
    @home.exclude_car
end

Entao('Valido que o carro foi cadastrado com sucesso') do
    @home.new_car_added?
end

Entao('valido que é retornado msg de lista vazia') do
    @home.title_empty_car_list?
end