# frozen_string_literal: true

require 'rspec/expectations'

class HomePage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'mycar', 'core'
  end

  def home_page?
    wait_for_element_exist @mappings['tcross_menu']
  end

  def click_add_btn
      click @mappings['add_btn']
  end

  #def send_keys_marca text
  #    fill_in @mappings['marca_input'], text
  #end

  #def send_keys_modelo text
  #    fill_in @mappings['modelo_input'], text
  #end

  #def send_keys_versao text
  #    fill_in @mappings['versao_input'], text
  #end

  #def send_keys_ano text
  #    fill_in @mappings['ano_input'], text
  #end

  #def click_resgister_btn
  #    click @mappings['cadastrar_btn']
  #end

  def exclude_car
    swiper_element_direction @mappings['tcross_menu'], 'left'
    click @mappings['delete_menu']
    swiper_element_direction @mappings['pulse_menu'], 'left'
    click @mappings['delete_menu']
    swiper_element_direction @mappings['kwid_menu'], 'left'
    click @mappings['delete_menu']
  end

  def new_car_added?
      wait_for_element_exist @mappings['compass_menu']
  end

  def title_empty_car_list?
      wait_for_element_exist @mappings['empty_car_list']
  end
end
