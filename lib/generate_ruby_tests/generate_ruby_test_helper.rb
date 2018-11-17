#!/usr/bin/env ruby

def create_feature_file(name)
  # opcoes usadas para gerar o arquivo na funcao de modelo
  opts = { name: camelize(name) }
  # Thor cria um arquivo com base no modelo templates/feature.tt
  template('feature', File.join(FileUtils.pwd, 'features', 'specifications',
                                "#{name.downcase}.feature"), opts)
end

def create_steps_file(name)
  # opcoes usadas para gerar o arquivo na funcao de modelo
  opts = { name: camelize(name) }
  # Thor cria um arquivo com base no modelo templates/steps.tt
  template('steps', File.join(FileUtils.pwd, 'features', 'steps_definitions',
                              "#{name.downcase}_steps.rb"), opts)
end

def create_page_file(name)
  # opcoes usadas para gerar o arquivo na funcao de modelo
  opts = { name: camelize(name) }
  # Thor cria um arquivo com base no modelo templates/page.tt
  template('page', File.join(FileUtils.pwd, 'features', 'pages',
                             "#{name.downcase}_page.rb"), opts)
end

def create_service_file(name)
  # opcoes usadas para gerar o arquivo na funcao de modelo
  opts = { name: camelize(name) }
  # Thor cria um arquivo com base no modelo templates/services.tt
  template('services', File.join(FileUtils.pwd, 'features', 'services',
                                 "#{name.downcase}_services.rb"), opts)
end

def create_screens_file(name)
  # opcoes usadas para gerar o arquivo na funcao de modelo
  opts = { name: camelize(name) }
  # Thor cria um arquivo com base no modelo templates/screens.tt
  template('screens', File.join(FileUtils.pwd, 'features', 'screens',
                                "#{name.downcase}_screens.rb"), opts)
end

def create_spec_file(name)
  # opcoes usadas para gerar o arquivo na funcao de modelo
  opts = { name: camelize(name) }
  # Thor cria um arquivo com base no modelo templates/specs.tt
  template('specs', File.join(FileUtils.pwd, 'spec',
                              "#{name.downcase}_spec.rb"), opts)
end

def camelize(string)
  camelized = ''
  string.split('_').each do |s|
    camelized += s.capitalize
  end
  camelized
end

def in_root_project_folder?
  # Olha se o usuario esta na pasta raiz do projeto
  unless Dir.exist?(File.join(FileUtils.pwd, 'features', 'specifications'))
    puts 'Please run this command on the root folder of the project'
    exit 1
  end
  true
end
