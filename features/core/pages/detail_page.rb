# frozen_string_literal: true

require 'rspec/expectations'

class DetailPage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'detailcar', 'core'
  end

  def get_name_brand
      get_text @mappings['brand_detail_navigationlink']
  end

  def get_name_model
      get_text @mappings['model_detail_navigationlink']
  end

  def get_name_version
      get_text @mappings['version_detail_navigationlink']
  end

  def get_name_year
      get_text @mappings['year_detail_navigationlink']
  end

end