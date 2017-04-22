# Fractal Test

### Objetivo do teste

Implementar uma Web Service RESTful capaz de se comunicar com aplicações mobile e web.
O Web Service deverá ter as operações comuns a um Scaffold Rails:
  - Listar itens
  - Exibir item
  - Adicionar item
  - Editar item
  - Apagar item
Deverão existir três ou mais entidades relacionadas com a entidade principal. Porém, só é necessário listar, exibir, adicionar, editar e apagar itens da entidade principal.

### Requisitos

* Utilizar como exemplo a seguinte API: https://punkapi.com/documentation/v2
* Criar três ou mais Models
* Ter uma associação entre Models do tipo 1..n
* Ter uma associação entre Models do tipo n..n
* Ter uma chamada de busca por string (busca em um ou mais Models)
* A aplicação deve ser Rails API-only
* Elaborar documento de especificação das chamadas ao WebService
* Seguir os padrões e convenções do Ruby on Rails
* Seguir o padrão RESTful
* Seguir Normalização do Banco de Dados
* Implementar Testes Unitários e Funcionais
* Utilizar o Ruby on Rails 5 ou superior
* Utilizar Ruby 2.3.3 ou superior
* Utilizar o RVM ou outra ferramenta para gerenciamento de versões Ruby
* Enviar o código para um repositório git público (github, Bitbucket, Gitlab)

### Bônus

* Utilizar Swagger ou outra ferramenta para documentação da API
* Criar uma aplicação web separada em Ruby on Rails que consuma o Web Service criado
* Implementar testes com RSpec e/ou Cucumber
* Utilizar FactoryGirl ao invés de fixtures
* Utilizar Redis para cache
* Utilizar Elasticsearch para consultas
* Utilizar Sidekiq para Background Jobs
