# frozen_string_literal: true

require 'rspec/expectations'

class HomePage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'mycar', 'core'
  end

  def home_page?
    wait_for_element_exist @mappings['home_title']
  end

  def click_add_btn
      click @mappings['add_btn']
  end

  def send_keys_marca text
      fill_in @mappings['marca_input'], text
  end

  def send_keys_modelo text
      fill_in @mappings['modelo_input'], text
  end

  def send_keys_versao text
      fill_in @mappings['versao_input'], text
  end

  def send_keys_ano text
      fill_in @mappings['ano_input'], text
  end

  def click_resgister_btn
      click @mappings['cadastrar_btn']
  end

  def new_car_added?
      wait_for_element_exist @mappings['compass_menu']
  end
end
