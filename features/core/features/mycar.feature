# language: pt
Funcionalidade: Cadastro Veiculo

    Contexto: Carregar o aplicativo de Mycar
        Dado   Que estou na home do app

    @cadastro_sucesso @sanity
    Cenário: Verifique que é possível cadastrar um novo veiculo
        Quando Clico em Add
        E Preencho os dados do veiculo
               | marca | modelo     | versao         | ano_modelo |
               | Jeep  | Compass    | Longitude 2.0  | 2023       |
        E Clico em cadastrar
        Então  Valido que o carro foi cadastrado com sucesso

    @detalhe_veiculo @sanity
    Cenário: Verifique que é possivel verificar o detalhe do carro
        Quando seleciono o carro "KWID"
        Entao valido o detalhe do carro
            | marca   | modelo | versao | ano  |
            | RENAULT | KWID   | 1.0    | 2019 |


    @remover_carro @sucesso @sanity
    Cenário: Verifique feedback para lista de carros vazia
        Quando Apago todos os carros da lista
        Entao valido que é retornado msg de lista vazia
