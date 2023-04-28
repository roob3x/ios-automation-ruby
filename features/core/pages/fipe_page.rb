
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
    @brand =  @mappings['brand_fipe']
    @brand['value'] = @brand['value'].to_s.gsub('NAME', text)
    click @brand
  end

  def click_on_model_pickle
    click @mappings['model_pickle']
  end

  def select_model_fipe text
    model = @mappings['model_fipe']
    model['value'] = model['value'].to_s.gsub('NAME', text)
    click model
  end

  def click_on_year_pickle
    click @mappings['year_pickle']
  end

  def select_year_fipe text
    year = @mappings['year_type_fipe']
    year['value'] = year['value'].to_s.gsub('NAME', text)
    click year
  end

  def get_value_ref_fipe
    get_text @mappings['month_ref']
  end

  def get_code_fipe
    get_text @mappings['code_fipe']
  end

  def get_value_fipe
    get_text @mappings['value_fipe']
  end

end