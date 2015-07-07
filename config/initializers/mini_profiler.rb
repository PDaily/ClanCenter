require 'rack-mini-profiler'
Rack::MiniProfiler.config.skip_paths = ['/admin']