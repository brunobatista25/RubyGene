require 'fileutils'

RSpec.describe GenerateRubyTests do

  describe 'Rubygene' do
    before(:each) do
      @project_name_web = 'web_automator_rspec'
      @project_name_api = 'api_automator_rspec'
    end

    after(:each) do
      FileUtils.rm_rf(@project_name_web)
      FileUtils.rm_rf(@project_name_api)
    end

    describe 'Validar comandos do rubygene' do
      context 'criar projeto' do
        it 'web' do
          system "rubygene new_rspec_web #{@project_name_web}"
          expect(Dir.entries(@project_name_web)).to include('pages', 'specs', 'support', '.gitignore', '.rspec', 'Gemfile', 'README.md')
          expect(Dir.entries("#{@project_name_web}/pages")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_web}/specs")).to include('spec_helper.rb')
          expect(Dir.entries("#{@project_name_web}/support")).to include('data', 'page_helper.rb', 'rspec.yml')
          expect(Dir.entries("#{@project_name_web}/support/data")).to include('homolog.yml')
        end
        it 'api' do
          system "rubygene new_rspec_api #{@project_name_api}"
          expect(Dir.entries(@project_name_api)).to include('results', 'services', 'specs', '.gitignore', '.rspec', 'Gemfile', 'README.md')
          expect(Dir.entries("#{@project_name_api}/results")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_api}/services")).to include('.gitkeep')
          expect(Dir.entries("#{@project_name_api}/specs")).to include('spec_helper.rb')
        end
      end
    end

    context 'Tentar criar projeto com argumento inválido' do
      it 'projeto nao gerado da web' do
        system "rubygem new_rspec_web '#{@project_name_web}' argumento invalido"
        expect(Dir.entries('.')).not_to include(@project_name_web)
      end
      it 'projeto nao gerado da api' do
        system "rubygem new_rspec_api '#{@project_name_api}' argumento invalido"
        expect(Dir.entries('.')).not_to include(@project_name_api)
      end
    end

    context 'validar comandos generate' do
      it 'generate specs' do
        system "rubygene new_rspec_web '#{@project_name_web}'"
        @step_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate spec #{@step_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/specs")).to include ('arquivo_spec.rb')
      end
      it 'generate pages' do
        system "rubygene new_rspec_web '#{@project_name_web}'"
        @page_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate rspec_page #{@page_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/pages")).to include ('arquivo_page.rb')
      end
      it 'generate services' do
        system "rubygene new_rspec_api '#{@project_name_api}'"
        @service_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate rspec_service #{@service_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/services")).to include ('arquivo_services.rb')
      end
      it 'generate all_web' do
        system "rubygene new_rspec_web '#{@project_name_web}'"
        @all_web_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate all_web_rspec #{@all_web_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/pages")).to include ('arquivo_page.rb')
        expect(Dir.entries("#{@project_name_web}/specs")).to include ('arquivo_spec.rb')
      end
      it 'generate all_api' do
        system "rubygene new_rspec_api '#{@project_name_api}'"
        @all_api_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate all_api_rspec #{@all_api_name}"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/services")).to include ('arquivo_services.rb')
        expect(Dir.entries("#{@project_name_api}/specs")).to include ('arquivo_spec.rb')
      end
    end

    context 'validar comandos generate invalidos' do
      it 'generate steps' do
        system "rubygene new_rspec_web '#{@project_name_web}'"
        @step_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate spec #{@step_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/specs")).not_to include ('arquivo_spec.rb')
      end
      it 'generate pages' do
        system "rubygene new_rspec_web '#{@project_name_web}'"
        @page_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate rspec_page #{@page_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}//pages")).not_to include ('arquivo_page.rb')
      end
      it 'generate services' do
        system "rubygene new_rspec_api #{@project_name_api}"
        @service_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate rspec_service #{@service_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/services")).not_to include ('arquivo_services.rb')
      end
      it 'generate all_web' do
        system "rubygene new_rspec_web '#{@project_name_web}'"
        @all_web_name = 'arquivo'
        Dir.chdir(@project_name_web)
        system "rubygene generate all_web_rspec #{@all_web_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_web}/pages")).not_to include ('arquivo_page.rb')
        expect(Dir.entries("#{@project_name_web}/specs")).not_to include ('arquivo_spec.rb')
      end
      it 'generate all_api' do
        system "rubygene new_rspec_api '#{@project_name_api}'"
        @all_api_name = 'arquivo'
        Dir.chdir(@project_name_api)
        system "rubygene generate all_api_rspec #{@all_api_name} invalid_argument"
        Dir.chdir('../')
        expect(Dir.entries("#{@project_name_api}/services")).not_to include ('arquivo_services.rb')
        expect(Dir.entries("#{@project_name_api}/specs")).not_to include ('arquivo_spec.rb')
      end
    end

    context 'Validar traducoes' do
      context 'pt' do

        it 'specs' do
          system "rubygene new_rspec_web '#{@project_name_web}'"
          @feature_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate spec '#{@feature_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/specs")).to include ('arquivo_spec.rb')
          expect(File.readlines("#{@project_name_web}/specs/#{@feature_name}_spec.rb")).
            to include("describe 'descrição' do\n",
                       "  context 'descrição' do\n",
                       "    it 'faz alguma coisa' do\n",
                       "    end\n",
                       "  end\n",
                       "end")
        end
        it 'pages' do
          system "rubygene new_rspec_web '#{@project_name_web}'"
          @page_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate rspec_page '#{@page_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/pages")).to include ('arquivo_page.rb')
          expect(File.readlines("#{@project_name_web}/pages/#{@page_name}_page.rb")).
            to include("class #{@page_name.capitalize}Page < SitePrism::Page\n",
                       "  # Declare todos os elementos da página\n",
                       "  # element :button,       pending 'Insert button identificator'\n",
                       "end\n")
        end
        it 'services' do
          system "rubygene new_rspec_api '#{@project_name_api}'"
          @service_name = 'arquivo'
          Dir.chdir(@project_name_api)
          system "rubygene generate rspec_service '#{@service_name}' --lang=pt"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_api}/services")).to include ('arquivo_services.rb')
          expect(File.readlines("#{@project_name_api}/services/#{@service_name}_services.rb")).
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

       it 'specs' do
         system "rubygene new_rspec_web '#{@project_name_web}'"
         @feature_name = 'arquivo'
         Dir.chdir(@project_name_web)
         system "rubygene generate spec '#{@feature_name}'"
         Dir.chdir('../')
         expect(Dir.entries("#{@project_name_web}/specs")).to include ('arquivo_spec.rb')
         expect(File.readlines("#{@project_name_web}/specs/#{@feature_name}_spec.rb")).
           to include("describe 'description' do\n",
                      "  context 'description' do\n",
                      "    it 'does something' do\n",
                      "    end\n",
                      "  end\n",
                      "end")
       end
        it 'pages' do
          system "rubygene new_rspec_web '#{@project_name_web}'"
          @page_name = 'arquivo'
          Dir.chdir(@project_name_web)
          system "rubygene generate rspec_page #{@page_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_web}/pages/")).to include ('arquivo_page.rb')
          expect(File.readlines("#{@project_name_web}/pages/#{@page_name}_page.rb")).
            to include("class #{@page_name.capitalize}Page < SitePrism::Page\n",
                       "  # Declare all the elements of this page\n",
                       "  # element :button,       pending 'Insert button identificator'\n",
                       "end\n")
        end
        it 'services' do
          system "rubygene new_rspec_api '#{@project_name_api}'"
          @service_name = 'arquivo'
          Dir.chdir(@project_name_api)
          system "rubygene generate rspec_service #{@service_name}"
          Dir.chdir('../')
          expect(Dir.entries("#{@project_name_api}/services")).to include ('arquivo_services.rb')
          expect(File.readlines("#{@project_name_api}/services/#{@service_name}_services.rb")).
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
