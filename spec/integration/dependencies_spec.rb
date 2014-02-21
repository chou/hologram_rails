require 'spec_helper'

describe "getting Hologram and Guard-Hologram" do
  TMP = File.join(File.dirname(__FILE__), '..', '..', 'tmp')
  PWD = Dir.pwd

  before :all do
    FileUtils::cd TMP

    FileUtils::rm_rf File.join(TMP, 'test_app')
    `rails new test_app`

    FileUtils::cd File.join(TMP, 'test_app')
    File.open('Gemfile', 'a') do |file|
      file << <<-RUBY

        gem 'hologram_rails', path: '../../'
        gem 'hologram', github: "trulia/hologram"
      RUBY
    end

    `bundle`
    `bundle exec rails g hologram_rails:install`
  end

  it "should add Hologram and Guard-Hologram to the Gemfile" do
    expect(`bundle exec gem list`).to include('hologram', 'guard-hologram')
  end

  it "should run hologram init" do
    expect(File.exists?('hologram_config.yml')).to be_true
  end

  it "should run guard init" do
    expect(File.exists?('Guardfile')).to be_true
    expect(File.read('Guardfile')).to include("guard 'hologram'")
  end

  it 'should generate a styleguide' do
    expect(`bundle exec hologram`).to include('Build completed.')
  end

  after :all do
    FileUtils::rm_rf File.join(TMP, 'test_app')
    FileUtils::cd PWD
  end
end