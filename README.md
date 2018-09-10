# GenerateRubyTests

Bem vindo a gem GenerateRubyTests é uma gem baseada na gem [Magneton](https://github.com/concretesolutions/magneton).

O intuito da gem GenerateRubyTests é conseguir gerar projetos já configurados para um projeto Web, Mobile ou Api. Todos eles baseados na estrutura de um projeto em cucumber.

## Instalação

Adicione este comando no terminal:

```ruby
gem install generate_ruby_tests
```

# Usando a gem


## Gerar um projeto Web

```ruby
generate_repo_test new_web nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Features: Onde fica as funcionalidades do projeto;

Steps: Onde são realizados os testes de fato;

Pages: Onde fica mapeado os elementos e metódos de uma determinada página;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

## Gerar um projeto Api

```ruby
generate_repo_test new_api nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Features: Onde fica as funcionalidades do projeto;

Steps: Onde são realizados os testes de fato;

Services: Onde fica as configuraçōes do serviço;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

## Gerar um projeto Mobile

```ruby
generate_repo_test new_mobile nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Features: Onde fica as funcionalidades do projeto;

Steps: Onde são realizados os testes de fato;

Screens: Onde fica mapeado os elementos e metódos de uma determinada screen;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

E tambem é possivel gerar os steps,features,services,pages etc... sozinhos 

## Gerar um step

```ruby
generate_repo_test generate step nome_do_step
```

## Gerar um feature

```ruby
generate_repo_test generate feature nome_da_feature
```

## Gerar um page

```ruby
generate_repo_test generate page nome_da_page
```

## Gerar um screens

```ruby
generate_repo_test generate screen nome_da_screen
```

## Gerar um services

```ruby
generate_repo_test generate service nome_do_service
```

Agora se precisar criar uma feature, page e step também tem um atalho pra isso :)
 
## Gerar feature,page,step

```ruby
generate_repo_test generate all_web
```

Agora se precisar criar uma feature, screens e step também tem um atalho pra isso :)

## Gerar feature,screens,step

```ruby
generate_repo_test generate all_mobile
```

Agora se precisar criar uma feature, services e step também tem um atalho pra isso :)

## Gerar feature,services,step

```ruby
generate_repo_test generate all_api
```

Por padrão tudo e gerado em inglês caso precise utilizar em português rode com o `--lang=pt`

```ruby
generate_repo_test generate all_api --lang=pt
```

## Contribuição

Relatórios de bugs e solicitações de recebimento são bem-vindos no GitHub em https://github.com/brunobatista25/generate_ruby_tests. Este projeto destina-se a ser um espaço seguro e acolhedor para colaboração, e espera-se que os contribuintes adiram à [Contributor Covenant](http://contributor-covenant.org) Código de conduta.

## Licença

A gema está disponível como código aberto sob os termos do
 [MIT License](https://opensource.org/licenses/MIT).

## Código de conduta

Espera-se que todos que interagem nas bases de código do projeto GenerateRubyTests, rastreadores de problemas, salas de bate-papo e listas de discussão sigam o
 [code of conduct](https://github.com/brunobatista25/generate_ruby_tests/blob/master/CODE_OF_CONDUCT.md).