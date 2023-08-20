RSpec.configure do |config|
  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.backtrace_exclusion_patterns << %r{/gems/}

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.before(:suite) do
    # reindex models
    User.reindex
  end

  config.around(:each, search: true) do |example|
    p example
    Searchkick.callbacks(nil) do
      example.run
    end
  end
end
