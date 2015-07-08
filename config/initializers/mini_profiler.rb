if Rails.env.test? || Rails.env.development?
    require 'rack-mini-profiler'
    Rack::MiniProfiler.config.skip_paths = ['/admin']
end