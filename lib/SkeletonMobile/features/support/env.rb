require 'appium_lib'
require 'yaml'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

SERVER_URL = 'http://localhost:4723/wd/hub'.freeze
PORT = 4723
TWENTY_SECONDS = 20

World(Screens)
World(Helper)

Before do
  def opts
    {
      caps: {
        deviceName: 'Nexus 5X API 25',
        platformName: 'Android',
        app: File.join(File.dirname(__FILE__), 'nome_do_seu_app.apk'),
        newCommandTimeout: '3600'
      },
      appium_lib: { server_url: SERVER_URL, port: PORT }
    }
  end
end
