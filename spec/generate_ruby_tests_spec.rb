require 'fileutils'

RSpec.describe GenerateRubyTests do
  it 'validar que nao esta nulo' do
    expect(GenerateRubyTests::VERSION).not_to be nil
  end

  describe 'Rubygene' do
    before(:each) do
      @project_name_web = 'web_automator'
      @project_name_api = 'api_automator'
      @project_name_mobile = 'mobile_automator'
    end

    after(:each) do
      FileUtils.rm_rf(@project_name_web)
      FileUtils.rm_rf(@project_name_api)
      FileUtils.rm_rf(@project_name_mobile)
    end

    describe 'Validar comandos do rubygene' do
      context 'criar projeto' do
        it 'web' do
          system "rubygene new_web #{@project_name_web}"
          expect(Dir.entries(@project_name_web)).to include('features', 'results', '.gitignore', 'cucumber.yml', 'Gemfile', 'Rakefile', 'README.md')
          expect(Dir.entries("#{@project_name_web}/features")).to include('pages', 'specifications', 'steps_definitions', 'support')
          expect(Dir.entries("#{@project_name_web}/features/pages")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_web}/features/specifications")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_web}/features/support")).to include('config', 'env.rb', 'helper.rb', 'hooks.rb', 'page_helper.rb')
          expect(Dir.entries("#{@project_name_web}/features/support/config")).to include('dev.yml', 'hmg.yml')
          expect(Dir.entries("#{@project_name_web}/results")).to include('report.html', 'report.json', 'screenshots')
          expect(Dir.entries("#{@project_name_web}/results/screenshots")).to include('.gitkeep')
        end
        it 'api' do
          system "rubygene new_api #{@project_name_api}"
          expect(Dir.entries(@project_name_api)).to include('features', 'results', '.gitignore', 'cucumber.yml', 'Gemfile', 'Rakefile', 'README.md')
          expect(Dir.entries("#{@project_name_api}/features")).to include('services', 'specifications', 'steps_definitions', 'support')
          expect(Dir.entries("#{@project_name_api}/features/services")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_api}/features/specifications")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_api}/features/steps_definitions")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_api}/features/support")).to include('config', 'env.rb')
          expect(Dir.entries("#{@project_name_api}/features/support/config")).to include('dev.yml', 'hmg.yml')
          expect(Dir.entries("#{@project_name_api}/results")).to include('report.html', 'report.json')
        end
        it 'mobile' do
          system "rubygene new_mobile #{@project_name_mobile}"
          expect(Dir.entries(@project_name_mobile)).to include('features', 'results', '.gitignore', 'cucumber.yml', 'Gemfile', 'README.md')
          expect(Dir.entries("#{@project_name_mobile}/features")).to include('screens', 'specifications', 'steps_definitions', 'support')
          expect(Dir.entries("#{@project_name_mobile}/features/screens")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_mobile}/features/specifications")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_mobile}/features/steps_definitions")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_mobile}/features/support")).to include('appium.txt', 'env.rb', 'helper.rb', 'hooks.rb', 'page_helper.rb')
          expect(Dir.entries("#{@project_name_mobile}/results")).to include('screenshots', 'report.html', 'report.json')
          expect(Dir.entries("#{@project_name_mobile}/results/screenshots")).to include('.gitkeep')
        end
      end
    end

    context 'Tentar criar projeto com argumento inválido' do
      it 'projeto nao gerado da web' do
        system "rubygem new_web '#{@project_name_web}' argumento invalido"
        expect(Dir.entries('.')).not_to include(@project_name_web)
      end
      it 'projeto nao gerado da api' do
        system "rubygem new_api '#{@project_name_api}' argumento invalido"
        expect(Dir.entries('.')).not_to include(@project_name_api)
      end
      it 'projeto nao gerado do mobile' do
        system "rubygem new_mobile '#{@project_name_mobile}' argumento invalido"
        expect(Dir.entries('.')).not_to include(@project_name_mobile)
      end
    end

    context 'validar comandos generate' do
      it 'generate feature' do
        system "rubygene new_web '#{@project_name_web}'"
        @feature_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate feature #{@feature_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/specifications")).to include ('arquivo.feature')
      end
      it 'generate steps' do
        system "rubygene new_web '#{@project_name_web}'"
        @step_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate step #{@step_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).to include ('arquivo_steps.rb')
      end
      it 'generate pages' do
        system "rubygene new_web '#{@project_name_web}'"
        @page_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate page #{@page_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/pages")).to include ('arquivo_page.rb')
      end
      it 'generate screen' do
        system "rubygene new_mobile '#{@project_name_mobile}'"
        @screen_name = 'arquivo'
        Dir.chdir(@project_name_mobile)
        system "rubygene generate screen #{@screen_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_mobile}/features/screens")).to include ('arquivo_screens.rb')
      end
      it 'generate services' do
        system "rubygene new_api '#{@project_name_api}'"
        @service_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate service #{@service_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/features/services")).to include ('arquivo_services.rb')
      end
      it 'generate all_web' do
        system "rubygene new_web '#{@project_name_web}'"
        @all_web_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate all_web #{@all_web_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/specifications")).to include ('arquivo.feature')
        expect(Dir.entries("#{@project_name_web}/features/pages")).to include ('arquivo_page.rb')
        expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).to include ('arquivo_steps.rb')
      end
      it 'generate all_api' do
        system "rubygene new_api '#{@project_name_api}'"
        @all_api_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate all_api #{@all_api_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/features/specifications")).to include ('arquivo.feature')
        expect(Dir.entries("#{@project_name_api}/features/services")).to include ('arquivo_services.rb')
        expect(Dir.entries("#{@project_name_api}/features/steps_definitions")).to include ('arquivo_steps.rb')
      end
      it 'generate all_mobile' do
        system "rubygene new_mobile '#{@project_name_mobile}'"
        @all_mobile_name = 'arquivo'
        Dir.chdir(@project_name_mobile)
        system "rubygene generate all_mobile #{@all_mobile_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_mobile}/features/specifications")).to include ('arquivo.feature')
        expect(Dir.entries("#{@project_name_mobile}/features/screens")).to include ('arquivo_screens.rb')
        expect(Dir.entries("#{@project_name_mobile}/features/steps_definitions")).to include ('arquivo_steps.rb')
      end
    end

    context 'validar comandos generate invalidos' do
      it 'generate feature' do
        system "rubygene new_web '#{@project_name_web}'"
        @feature_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate feature #{@feature_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/specifications")).not_to include ('arquivo.feature')
      end
      it 'generate steps' do
        system "rubygene new_web '#{@project_name_web}'"
        @step_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate step #{@step_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).not_to include ('arquivo_steps.rb')
      end
      it 'generate pages' do
        system "rubygene new_web '#{@project_name_web}'"
        @page_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate page #{@page_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/pages")).not_to include ('arquivo_page.rb')
      end
      it 'generate screen' do
        system "rubygene new_mobile #{@project_name_mobile}"
        @screen_name = 'arquivo'
        Dir.chdir(@project_name_mobile)
        system "rubygene generate screen #{@screen_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_mobile}/features/screens")).not_to include ('arquivo_screens.rb')
      end
      it 'generate services' do
        system "rubygene new_api #{@project_name_api}"
        @service_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate service #{@service_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/features/services")).not_to include ('arquivo_services.rb')
      end
      it 'generate all_web' do
        system "rubygene new_web '#{@project_name_web}'"
        @all_web_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate all_web #{@all_web_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/features/specifications")).not_to include ('arquivo.feature')
        expect(Dir.entries("#{@project_name_web}/features/pages")).not_to include ('arquivo_page.rb')
        expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).not_to include ('arquivo_steps.rb')
      end
      it 'generate all_api' do
        system "rubygene new_api '#{@project_name_api}'"
        @all_api_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate all_api #{@all_api_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/features/specifications")).not_to include ('arquivo.feature')
        expect(Dir.entries("#{@project_name_api}/features/services")).not_to include ('arquivo_services.rb')
        expect(Dir.entries("#{@project_name_api}/features/steps_definitions")).not_to include ('arquivo_steps.rb')
      end
      it 'generate all_mobile' do
        system "rubygene new_mobile #{@project_name_mobile}"
        @all_mobile_name = 'arquivo'
        Dir.chdir(@project_name_mobile)
        system "rubygene generate all_mobile #{@all_mobile_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_mobile}/features/specifications")).not_to include ('arquivo.feature')
        expect(Dir.entries("#{@project_name_mobile}/features/screens")).not_to include ('arquivo_screens.rb')
        expect(Dir.entries("#{@project_name_mobile}/features/steps_definitions")).not_to include ('arquivo_steps.rb')
      end
    end

    context 'Validar traducoes' do
      context 'pt' do
        it 'feature' do
          system "rubygene new_web '#{@project_name_web}'"
          @feature_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate feature '#{@feature_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/features/specifications")).to include ('arquivo.feature')
          expect(File.readlines("#{@project_name_web}/features/specifications/#{@feature_name}.feature")).
            to include("# language: pt\n",
                       "Funcionalidade: #{@feature_name.capitalize}\n",
                       "\n",
                       "  Contexto:\n",
                       "    # Insira os passos\n",
                       "\n",
                       "  Cenário: Primeiro Cenário\n",
                       "    # Insira os passos\n")
        end
        it 'steps' do
          system "rubygene new_web '#{@project_name_web}'"
          @feature_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate step '#{@feature_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).to include ('arquivo_steps.rb')
          expect(File.readlines("#{@project_name_web}/features/steps_definitions/#{@feature_name}_steps.rb")).
            to include("######### DADO #########\n",
                       "\n",
                       "######### QUANDO #########\n",
                       "\n",
                       "######### ENTÃO #########\n")
        end
        it 'pages' do
          system "rubygene new_web '#{@project_name_web}'"
          @page_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate page '#{@page_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/features/pages")).to include ('arquivo_page.rb')
          expect(File.readlines("#{@project_name_web}/features/pages/#{@page_name}_page.rb")).
            to include("class #{@page_name.capitalize}Page < SitePrism::Page\n",
                       "  # Declare todos os elementos da página\n",
                       "  # element :button,       pending 'Insert button identificator'\n",
                       "end\n")
        end
        it 'screen' do
          system "rubygene new_mobile '#{@project_name_mobile}'"
          @screen_name = 'arquivo'
          Dir.chdir(@project_name_mobile)
          system "rubygene generate screen '#{@screen_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_mobile}/features/screens")).to include ('arquivo_screens.rb')
          expect(File.readlines("#{@project_name_mobile}/features/screens/#{@screen_name}_screens.rb")).
            to include("class #{@screen_name.capitalize}Screen\n",
                       "  # Declare todos os elementos da página\n",
                       "end\n")
        end
        it 'services' do
          system "rubygene new_api '#{@project_name_api}'"
          @service_name = 'arquivo'
          Dir.chdir(@project_name_api)
          system "rubygene generate service '#{@service_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_api}/features/services")).to include ('arquivo_services.rb')
          expect(File.readlines("#{@project_name_api}/features/services/#{@service_name}_services.rb")).
            to include("module #{@service_name.capitalize}Service\n",
                       "  include HTTParty\n",
                       "  # Onde fica as configuraçōes de uma determinada requisição\n",
                       "  base_uri CONFIG['url_default'].to_s\n",
                       "  headers 'Content-Type' => 'application/json'\n",
                       "  format :json\n",
                       "end\n")
        end
      end

      context 'en' do
        it 'feature' do
          system "rubygene new_web '#{@project_name_web}'"
          @feature_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate feature #{@feature_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/features/specifications")).to include ('arquivo.feature')
          expect(File.readlines("#{@project_name_web}/features/specifications/#{@feature_name}.feature")).
            to include("# language: en\n",
                       "Feature: #{@feature_name.capitalize}\n",
                       "\n",
                       "  Background:\n",
                       "    # Insert steps\n",
                       "\n",
                       "  Scenario: First Scenario\n",
                       "    # Insert steps\n")
        end
        it 'steps' do
          system "rubygene new_web '#{@project_name_web}'"
          @feature_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate step #{@feature_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/features/steps_definitions")).to include ('arquivo_steps.rb')
          expect(File.readlines("#{@project_name_web}/features/steps_definitions/#{@feature_name}_steps.rb")).
            to include("######### GIVEN #########\n",
                       "\n",
                       "######### WHEN #########\n",
                       "\n",
                       "######### THEN #########\n")
        end
        it 'pages' do
          system "rubygene new_web '#{@project_name_web}'"
          @page_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate page #{@page_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/features/pages")).to include ('arquivo_page.rb')
          expect(File.readlines("#{@project_name_web}/features/pages/#{@page_name}_page.rb")).
            to include("class #{@page_name.capitalize}Page < SitePrism::Page\n",
                       "  # Declare all the elements of this page\n",
                       "  # element :button,       pending 'Insert button identificator'\n",
                       "end\n")
        end
        it 'screen' do
          system "rubygene new_mobile '#{@project_name_mobile}'"
          @screen_name = 'arquivo'
          Dir.chdir(@project_name_mobile)
          system "rubygene generate screen #{@screen_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_mobile}/features/screens")).to include ('arquivo_screens.rb')
          expect(File.readlines("#{@project_name_mobile}/features/screens/#{@screen_name}_screens.rb")).
            to include("class #{@screen_name.capitalize}Screen\n",
                       "  # Declare all the elements of this page\n",
                       "end\n")
        end
        it 'services' do
          system "rubygene new_api '#{@project_name_api}'"
          @service_name = 'arquivo'
          Dir.chdir(@project_name_api)
          system "rubygene generate service #{@service_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_api}/features/services")).to include ('arquivo_services.rb')
          expect(File.readlines("#{@project_name_api}/features/services/#{@service_name}_services.rb")).
            to include("module #{@service_name.capitalize}Service\n",
                       "  include HTTParty\n",
                       "  # Where is the configuration of a particular request\n",
                       "  base_uri CONFIG['url_default'].to_s\n",
                       "  headers 'Content-Type' => 'application/json'\n",
                       "  format :json\n",
                       "end\n")
        end
      end
    end
  end
end
