module MobileCommons
  def format_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    JSON.parse(json.to_json)
  end

  def time_now
    Time.now.strftime('%d/%m/Y %H:%M:$S.%L - GMT %z')
  end

  def date_now(result_fromat = '%d/%m/%Y')
    Time.now.strftime(result_format)
  end

  def date_tomorrow_format(result_fromat = '%d/%m/%Y')
    Time.now.tomorrow.strftime(result_format)
  end

  def subtract_from_date_now(previous_days = 0, result_format = '%d/%m/%Y')
    t = Time.now - previous_days.days
    t.strftime(result_format)
  end

  def add_in_date_now(next_days = 0, result_format = '%d/%m/%Y')
    t = Time.now + next_days.days
    t.strftime(result_format)
  end

  def generate_random_number
    rand(0o0000000000..100_000_000_00)
  end

  def generate_cpf(format = false)
    format.eql?(true) ? Faker::CPF.pretty : Faker::CPF.numeric
  end

  #def generate_cnpj(format = false)
  #  format.eql?(true) ? Faker::CNPJ.pretty : Faker::CNPJ.numeric
  #end

  def generate_name
    Faker::Name.name
  end

  def generate_float_with_limit(limit)
    rand(0.00..limit)
  end

  def generate_random_phone_number
    Faker::PhoneNumber.cell_phone_in_e164[3..]
  end

  def generate_uuid
    Faker::Internet.uuid
  end

  def generate_email
    Faker::Internet.email
  end

  def generate_random_string(min = 0, max = 100)
    (min... max).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def generate_random_alphanumeric(number = 10)
    Faker::Alphanumeric(number: number)
  end

  def get_month
    month = Date.today.month
    month = month.to_s
    case month
    when "1"
        month = "Janeiro"
    when "2"
        month = "Fevereiro"
    when "3"
        month = "Marco"
    when "4"
        month = "Abril"
    when "5"
        month = "Maio"
     when "6"
        month = "Junho"
    when "7"
        month = "Julho"
    when "8"
        month = "Agosto"
    when "9"
        month = "Setembro"
    when "10"
        month = "Outubro"
    when "11"
        month = "Novembro"
     when "12"
        month = "Dezembro"
     else
        print('Ano invalido')
     end
  end

  def get_year
    year = Date.today.year
    year = year.to_s
  end
end