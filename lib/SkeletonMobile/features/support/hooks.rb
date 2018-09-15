Before do
  @appium_driver = Appium::Driver.new(opts, true)
  Appium.promote_appium_methods Object
  @settings = YAML.load_file(File.expand_path('../../cucumber.yml',
                                              File.dirname(__FILE__)))
  @driver.start_driver
  @driver.set_wait(TWENTY_SECONDS)
end

def scroll_screen(xone, yone, xtwo, ytwo)
  Appium::TouchAction.new.long_press(x: xone, y: yone)
                     .move_to(x: xtwo, y: ytwo).release.perform
end

After do |scenario|
  scenario_name = scenario.name..gsub(/[^A-Za-z ]/, '').gsub(/\s+/, '_')

  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed')
  else
    take_screenshot(scenario_name.downcase!, 'passed')
  end
end
