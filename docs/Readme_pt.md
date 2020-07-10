[![Gem Version](https://badge.fury.io/rb/rubygene.svg)](https://badge.fury.io/rb/rubygene)
[![Build Status](https://travis-ci.org/brunobatista25/RubyGene.svg?branch=master)](https://travis-ci.org/brunobatista25/RubyGene)
[![Test Coverage](https://api.codeclimate.com/v1/badges/6ac63623b0699225f219/test_coverage)](https://codeclimate.com/github/brunobatista25/RubyGene/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/6ac63623b0699225f219/maintainability)](https://codeclimate.com/github/brunobatista25/RubyGene/maintainability)


# Informação sobre atualizaçōes

Case precise saber o que foi adicionado ou removido da gem basta acessar  [Historico de Atualização](https://github.com/brunobatista25/RubyGene/blob/master/history.md)


# RubyGene

O intuito da RubyGene é conseguir gerar projetos de automação de testes já configurados para um projeto Web, Mobile ou Api. Todos eles baseados na estrutura de um projeto em cucumber, Rspec, page objects e relatórios. Baseado na gem https://github.com/concretesolutions/magneton

## Instalação

Adicione este comando no terminal:

```ruby
gem install rubygene
```

# Usando a gem

# Em um projeto com Cucumber

## Gerar um projeto Web

```ruby
rubygene new_web nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Specfications: Onde fica as funcionalidades do projeto;

Steps: Onde são realizados os testes de fato;

Pages: Onde fica mapeado os elementos e metódos de uma determinada página;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

## Gerar um projeto Api

```ruby
rubygene new_api nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Specfications: Onde fica as funcionalidades do projeto;

Steps: Onde são realizados os testes de fato;

Services: Onde fica as configuraçōes do serviço;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

## Gerar um projeto Mobile

```ruby
rubygene new_mobile nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Specfications: Onde fica as funcionalidades do projeto;

Steps: Onde são realizados os testes de fato;

Screens: Onde fica mapeado os elementos e metódos de uma determinada screen;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

E tambem é possivel gerar os steps,features,services,pages etc... sozinhos 

## Gerar um step

```ruby
rubygene generate step nome_do_step
```

## Gerar um feature

```ruby
rubygene generate feature nome_da_feature
```

## Gerar um page

```ruby
rubygene generate page nome_da_page
```

## Gerar um screens

```ruby
rubygene generate screen nome_da_screen
```

## Gerar um services

```ruby
rubygene generate service nome_do_service
```

Agora se precisar criar uma feature, page e step também tem um atalho pra isso :)
 
## Gerar feature,page,step

```ruby
rubygene generate all_web nome_do_arquivo
```

Agora se precisar criar uma feature, screens e step também tem um atalho pra isso :)

## Gerar feature,screens,step

```ruby 
rubygene generate all_mobile nome_do_arquivo
```

Agora se precisar criar uma feature, services e step também tem um atalho pra isso :)

## Gerar feature,services,step

```ruby
rubygene generate all_api nome_do_arquivo
```

Por padrão tudo e gerado em inglês caso precise utilizar em português rode com o `--lang=pt`

```ruby
rubygene generate all_api nome_do_arquivo --lang=pt
```

# Em um projeto Rspec

## Gerar um projeto Web

```ruby
rubygene new_rspec_web nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Specs: Onde são realizados os testes de fato;

Pages: Onde fica mapeado os elementos e metódos de uma determinada página;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.

## Gerar um projeto Api

```ruby
rubygene new_rspec_api nome_do_projeto
```

Onde irá gerar um projeto deste modelo, já com tudo configurado:

Specs: Onde são realizados os testes de fato;

Services: Onde fica as configuraçōes do serviço;

Support: Onde fica as configuraçōes do projeto;

Results: Onde fica o resultado dos testes e relatórios.


## Gerar um spec

```ruby
rubygene generate spec nome_do_spec
```

## Gerar um page

```ruby
rubygene generate rspec_page nome_da_page
```

## Gerar um services

```ruby
rubygene generate rspec_service nome_do_service
```

Agora se precisar criar uma page e spec também tem um atalho pra isso :)
 
## Gerar page,spec

```ruby
rubygene generate all_web_rspec nome_do_arquivo
```

Agora se precisar criar uma services e spec também tem um atalho pra isso :)

## Gerar services,spec

```ruby
rubygene generate all_api_rspec nome_do_arquivo
```

Por padrão tudo e gerado em inglês caso precise utilizar em português rode com o `--lang=pt`

```ruby
rubygene generate all_api_rspec nome_do_arquivo --lang=pt
```

## Para Proximas versōes

- Adicionar gerador pra JsonSchema
- Adicionar gerador de projeto calabash
- Adicionar gerador para projetos Rspec para Mobile.
- Adicionar gerador de drivers(baixar o driver específico e instalar no local correto.)

## Contribuição

Relatórios de bugs e solicitações de recebimento são bem-vindos no GitHub em https://github.com/brunobatista25/rubygene. Este projeto destina-se a ser um espaço seguro e acolhedor para colaboração, e espera-se que os contribuintes adiram à [Contributor Covenant](http://contributor-covenant.org) Código de conduta.

## Licença

A gema está disponível como código aberto sob os termos do
 [MIT License](https://opensource.org/licenses/MIT).

## Código de conduta

Espera-se que todos que interagem nas bases de código do projeto RubyGene, rastreadores de problemas, salas de bate-papo e listas de discussão sigam o
 [code of conduct](https://github.com/brunobatista25/rubygene/blob/master/CODE_OF_CONDUCT.md).
