require 'rails/generators'

module HologramRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "init and configure hologram and guard-hologram"

      source_root File.join(File.dirname(__FILE__), "templates")

      def init_hologram
        `bundle exec hologram init`
        remove_file('hologram_config.yml')
        copy_file('hologram_config.yml', 'hologram_config.yml')

        remove_file('doc_assets/_header.html')
        copy_file('_header.html', 'doc_assets/_header.html')
        remove_file('doc_assets/_footer.html')
        copy_file('_footer.html', 'doc_assets/_footer.html')
      end

      def init_guard
        `bundle exec guard init`
        gsub_file('Guardfile', 'guard "hologram"', <<-RUBY)
          guard 'hologram', config_path: 'hologram_config.yml' do
            watch(%r{app/assets/stylesheets/.*css})
            watch(%r{app/assets/javascripts/.*js})
            watch(%r{doc_assets/*})
            watch('hologram_config.yml')
          end
        RUBY
      end
    end
  end
end