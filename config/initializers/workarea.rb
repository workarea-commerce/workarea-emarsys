Workarea.configure do |config|
  config.emarsys ||= ActiveSupport::Configurable::Configuration.new

  config.emarsys.escher_key = 'suite_workarea_v1'
  config.emarsys.scope = 'eu/workarea/ems_request'
  config.emarsys.partner_scope = 'eu/suite/ems_request'

  config.emarsys.export_interval = 1.day

  config.emarsys.api_timeout = 3
  config.emarsys.open_timeout = 3
end
