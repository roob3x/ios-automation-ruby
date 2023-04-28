# language: pt
Funcionalidade: Consulta Veiculo atraves da tabela fipe

  Contexto: Carregar o aplicativo de Mycar
    Dado   Que estou na home do app

  @consulta_fipe @sanity
  Cenário: Verifique que o valor da tabela fipe sera atualizado
    Dado realizo a pesquisa pelo veiculo
      | marca | modelo                    | ano_modelo    |
      | BMW   | 116iA 1.6 TB 16V 136cv 5p | 2014 Gasolina |
    Entao valido retorno de valor, codigo fipe e valor atual
    Quando altero veiculo para
      | marca | modelo                       | ano_modelo    |
      | Audi  | A1 2.0 TFSI Quattro 256cv 3p | 2013 Gasolina |
    Entao valido que os valores da fipe foram atualizados