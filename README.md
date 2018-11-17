[![Gem Version](https://badge.fury.io/rb/rubygene.svg)](https://badge.fury.io/rb/rubygene)
[![Build Status](https://travis-ci.org/brunobatista25/RubyGene.svg?branch=master)](https://travis-ci.org/brunobatista25/RubyGene)
[![Test Coverage](https://api.codeclimate.com/v1/badges/6ac63623b0699225f219/test_coverage)](https://codeclimate.com/github/brunobatista25/RubyGene/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/6ac63623b0699225f219/maintainability)](https://codeclimate.com/github/brunobatista25/RubyGene/maintainability)

# Readme version translate

  Version [Portuguese-br] (https://github.com/brunobatista25/RubyGene/blob/master/docs/Readme_pt.md)

# Update Information

Case needs to know what was added or removed from the gem just access
 [Update History](https://github.com/brunobatista25/RubyGene/blob/master/history.md)


# RubyGene

The aim of RubyGene is to generate test automation projects already configured for a Web, Mobile or Api project. All of them based on the structure of a cucumber and Rspec project, page objects and reports.

## Installation

Add this command to the terminal:

```ruby
gem install rubygene
```

# Using gem

# In a project with Cucumber

## Generate a web project

```ruby
rubygene new_web nome_do_projeto
```

Where will generate a project of this model, already with everything configured:

Specfications: Where is the functionality of the project?

Steps: Where the actual tests are performed;

Pages: Where is mapped the elements and methods of a particular page;

Support: Where is the project settings?

Results: Where is the result of the tests and reports.

## Generate an API project


```ruby
rubygene new_api nome_do_projeto
```

Where will generate a project of this model, already with everything configured:

Specfications: Where is the functionality of the project?

Steps: Where the actual tests are performed;

Services: Where the service settings are;

Support: Where is the project settings?

Results: Where is the result of the tests and reports.

## Generate a Mobile project

```ruby
rubygene new_mobile nome_do_projeto
```

Where will generate a project of this model, already with everything configured:

Specfications: Where is the functionality of the project?

Steps: Where the actual tests are performed;

Screens: Where is mapped the elements and methods of a given screen;

Support: Where is the project settings?

Results: Where is the result of the tests and reports.

And it is also possible to generate the steps, features, services, pages etc ... alone

## Generate a step


```ruby
rubygene generate step nome_do_step
```

## Generate a feature


```ruby
rubygene generate feature nome_da_feature
```

## Generate a page

```ruby
rubygene generate page nome_da_page
```

## Generate a screens

```ruby
rubygene generate screen nome_da_screen
```

## Generate a services


```ruby
rubygene generate service nome_do_service
```

Now if you need to create a feature, page and step, you also have a shortcut to it :)
 
## Generate feature,page,step

```ruby
rubygene generate all_web nome_do_arquivo
```

Now if you need to create a feature, screens and step also have a shortcut to this :)

## Generate feature,screens,step

```ruby 
rubygene generate all_mobile nome_do_arquivo
```

Now if you need to create a feature, services and step also has a shortcut to it :)

## Generate feature,services,step

```ruby
rubygene generate all_api nome_do_arquivo
```

By default everything is generated in English if you need to use `--lang=pt`

```ruby
rubygene generate all_api nome_do_arquivo --lang=pt
```

# In an Rspec project

## Generate a web project

```ruby
rubygene new_rspec_web nome_do_projeto
```

Where will generate a project of this model, already with everything configured:

Specs: Where the actual tests are performed;

Pages: Where is mapped the elements and methods of a particular page;

Support: Where is the project settings?

Results: Where is the result of the tests and reports.

## Generate an API project

```ruby
rubygene new_rspec_api nome_do_projeto
```

Where will generate a project of this model, already with everything configured:

Specs: Where the actual tests are performed;

Services: Where the service settings are;

Support: Where is the project settings?

Results: Where is the result of the tests and reports.


## Generate a spec

```ruby
rubygene generate spec nome_do_spec
```

## Generate a page

```ruby
rubygene generate rspec_page nome_da_page
```

## Generate a services

```ruby
rubygene generate rspec_service nome_do_service
```

Now if you need to create a page and spec you also have a shortcut to it :)
 
## Generate page,spec

```ruby
rubygene generate all_web_rspec nome_do_arquivo
```

Now if you need to create a services and spec it also has a shortcut to it :)

## Generate services,spec

```ruby
rubygene generate all_api_rspec nome_do_arquivo
```

By default everything is generated in English if you need to use `--lang=pt`

```ruby
rubygene generate all_api_rspec nome_do_arquivo --lang=pt
```

## For next versions

- Add generator to JsonSchema
- Add calabash project generator
- Add generator for Rspec projects to Mobile.
- Add driver generator (download specific driver and install in the correct location)

## Contribution

Bug reports and receiving requests are welcome on GitHub at
https://github.com/brunobatista25/rubygene. This project is intended to be a safe and welcoming space for collaboration, and taxpayers are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of
 [MIT License](https://opensource.org/licenses/MIT).

## Code of conduct


Everyone who interacts with the RubyGene project codebases, problem trackers, chat rooms, and mailing lists is expected to follow the
 [code of conduct](https://github.com/brunobatista25/rubygene/blob/master/CODE_OF_CONDUCT.md).
