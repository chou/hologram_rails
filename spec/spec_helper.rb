require 'hologram_rails'
require 'rspec'

RSpec.configure do |config|
  config.color_enabled = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

#def create_tmp_dir