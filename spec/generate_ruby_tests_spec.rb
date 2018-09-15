require 'fileutils'
require 'simplecov'
require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov
SimpleCov.start

RSpec.describe GenerateRubyTests do
  it 'tem a versao da gem' do
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
  end
end
