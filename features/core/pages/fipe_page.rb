
require 'rspec/expectations'

class FipePage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'fipe', 'core'
  end

  def click_on_fipe_btn
    click @mappings['fipe_btn']
  end

  def click_on_brand_pickle
    click @mappings['brand_pickle']
  end
  
  def select_brand_fipe text
    click @mappings['brand_fipe']
  end

  def click_on_model_pickle
    click @mappings['model_pickle']
  end

  def select_model_fipe text
    click @mappings['model_fipe']
  end

  def click_on_year_pickle
    click @mappings['year_pickle']
  end

  def select_year_fipe text
    click @mappings['year_type_fipe']
  end

  def get_value_ref_fipe
    get_text @mappings['month_ref']
  end
end