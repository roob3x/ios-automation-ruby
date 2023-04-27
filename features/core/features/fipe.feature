# language: pt
Funcionalidade: Consulta Veiculo atraves da tabela fipe

  Contexto: Carregar o aplicativo de Mycar
      Dado   Que estou na home do app

  @consulta_fipe @sanity
  Cenário: Verifique que é possivel obter o valor de um veiculo da tabela fipe
      Quando clico na sessao fipe
      E preencho os dados do veiculo na fipe
        | marca | modelo                | ano_modelo    |
        | BMW   | 116iA TB 16V 136cv 5p | 2014 Gasolina |
      Então valido retorno de valor para o mes atual