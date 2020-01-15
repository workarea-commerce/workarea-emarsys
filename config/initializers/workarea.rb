Workarea.configure do |config|
  config.emarsys ||= ActiveSupport::Configurable::Configuration.new
  config.emarsys.export_interval = 1.day

  config.emarsys.api_timeout = 3
  config.emarsys.open_timeout = 3
end
