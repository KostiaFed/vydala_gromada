require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true
  config.action_controller.relative_url_root = '/vydala_gromada'

  config.cache_store = :memory_store

  # Static files and assets
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = true
  config.assets.digest = true
  config.assets.css_compressor = nil

  # SSL
  config.force_ssl = true

  # Logging
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::Logger.new(STDOUT).tap do |logger|
    logger.formatter = ::Logger::Formatter.new
  end.then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Background jobs
  config.active_job.queue_adapter = :async

  # Active Storage
  config.active_storage.service = :local

  # Email
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV.fetch('SMTP_ADDRESS', 'smtp.example.com'),
    port: ENV.fetch('SMTP_PORT', 587),
    domain: ENV.fetch('SMTP_DOMAIN', 'example.com'),
    user_name: ENV.fetch('SMTP_USER', ''),
    password: ENV.fetch('SMTP_PASSWORD', ''),
    authentication: :plain,
    enable_starttls_auto: true
  }

  config.action_mailer.default_url_options = { host: ENV.fetch('APP_HOST', 'example.com'), protocol: 'https' }

  # I18n
  config.i18n.fallbacks = true

  # Deprecations and migrations
  config.active_support.report_deprecations = false
  config.active_record.dump_schema_after_migration = false

  config.hosts.clear

  config.app_generators.generators = false
end

Rails.application.routes.default_url_options[:host] = ENV.fetch('APP_HOST', 'example.com')
