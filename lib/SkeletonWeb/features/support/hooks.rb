require_relative 'helper.rb'

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  scenario_name = scenario_name.gsub(',', '')
  scenario_name = scenario_name.gsub('(', '')
  scenario_name = scenario_name.gsub(')', '')
  scenario_name = scenario_name.gsub('#', '')

  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed')
  else
    take_screenshot(scenario_name.downcase!, 'passed')
  end
end
