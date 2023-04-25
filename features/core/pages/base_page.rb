# frozen_string_literal: true

def find_element(el)
  case el['type']
  when 'XPATH'
    $driver.find_element(:xpath, el['value'])
  when 'ID'
    $driver.find_element(:id, el['value'])
  when 'CLASS'
    $driver.find_element(:class, el['value'])
  when 'ACCESS_ID'
    $driver.find_element(:accessibility_id, el['value'])
  when 'TEXT'
    $driver.find_element(:text, el['value'])
  when 'NAME'
    $driver.find_element(:name, el['value'])
  else
    raise('tipo de elemento nao encontrado ou nao definido')
  end
end

def element_displayed?(el)
  $wait.until {find_element(el).displayed? }
  $logger.info("Aguardou a exibição do elemento #{el['value']} usando o tipo de busca #{el['type']}")
end

def click(el)
  wait_for_element_exist(el)
  find_element(el).click
  $logger.info("Clicou no botão #{el['value']} usando o tipo de busca #{el['type']}")
end

def wait_for_element_exist(el)
  $wait.until {element_exists? el}
  $logger.info("Aguardou a existência do elemento #{el['value']} usando o tipo de busca #{el['type']}")
end

def click_by_index(el, index)
  wait_for_element_exist(el)
  find_element(el)[index].click
  $logger.info("Clicou no indice #{index} do elemento #{el['value']} usando o tipo de busca #{el['type']}")
end

def element_exists?(el)
  $logger.info("Verificando se existe o elemento #{el['value']} usando o tipo de busca #{el['type']}")
  find_elements(el).count > 0
end

def find_elements(el)
  $logger.info("Buscou a lista de elementos #{el['value']} usando o tipo de busca #{el['type']}")
  case el['type']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value'])
  when 'ID'
    return $driver.find_elements(:id, el['value'])
  when 'CLASS'
    return $driver.find_elements(:class, el['value'])
  when 'ACCESS_ID'
    return $driver.find_elements(:accessibility_id, el['value'])
  else
    raise('elements?: Tipo não implementado ou não encontrado')
  end
end

def element_is_enabled?(el)
  $logger.info("Elemento habilitado #{el['value']} usando o tipo de busca #{el['type']}")
  find_elements(el).enabled
end

def get_text(el)
  $logger.info("Está buscando o texto do elemento #{el['value']} usando o tipo de busca #{el['type']}")
  wait_for_element_exist(el)
  find_element(el).text
end

def get_text_index(el, index)
  $logger.info("Indice do texto #{index} do elemento #{el['value']} usando o tipo de busca #{el['type']}")
  find_element(el)[index].text
end

def fill_in(el, text)
  element = find_element(el)
  clean_text(element)
  element.send_keys text
  $logger.info("Preencheu o campo #{el} usando o tipo de busca #{el['type']} com o valor #{text}")
end

def tap_screen(screen_x, screen_y)
  Appium::TouchAction.new.tap(x: screen_x, y: screen_y).perform
end

def clean_text(el)
  #if el.text.size > 0
  el.clear
  #end
end

def android?
  $platform == 'android'
end

def ios?
  $platform == 'ios'
end

def hide_keyboard
  if android?
    $driver.hide_keyboard
  elsif ios?
    $driver.hide_keyboard :pressKey
  end
  $logger.info('Fechou o teclado virtual')
end

def get_center_screen
        window = get_window
        start_x = window.height * 0.50
        start_y = window.height * 0.50
        {x: start_x, y: start_y }
end

 # Gets the size element
def get_size_element(el)
    element_size = find_element(el).size
    { size: element_size }
end

def swiper_element_direction(el, direction, size = 0.65)
  element_size = get_size_element(el)

  dir = direction.to_s.downcase
  $logger.info("Deslizando o element #{el.to_s.downcase}. Parametro escolhido: #{dir}")

  case dir
  when 'left'
    element = find_element(el)
    location = element.location
    start_x = location.x + element_size[:size].width
    start_y = location.y + element_size[:size].height / 2
    end_x = start_x - element_size[:size].width * 0.5
    end_y = start_y
  end
  $driver.execute_script("mobile: dragFromToForDuration", {'duration':'1.0', 'fromX': start_x, 'fromY': start_y, 'toX': end_x, 'toY': end_y})
end

def get_attribute(el, attribute)
  wait_for_element_exist(el)
  elemento = find_element(el)
  case attribute
  when 'value'
    elemento.attribute('value')
  when 'name'
    elemento.attribute('name')
  when 'label'
    elemento.attribute('label')
  else
    raise('Tipo de atributo nao definido')
  end
end

def refresh_screen
  $driver.refresh
end
