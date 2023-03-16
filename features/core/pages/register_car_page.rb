# frozen_string_literal: true

require 'rspec/expectations'

class RegisterCarPage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'registercar', 'core'
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
end
