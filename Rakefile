# frozen_string_literal: true

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default do
  if Dir['spec/dummy'].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir('../../')
  end
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_legacy_api_v2'
  Rake::Task['extension:test_app'].invoke

  system({ 'BUNDLE_GEMFILE' => File.expand_path('Gemfile', __dir__) }, 'rails g spree_data_feeds:install')
  system({ 'BUNDLE_GEMFILE' => File.expand_path('Gemfile', __dir__) }, 'rails g spree_posts:install')
  system({ 'BUNDLE_GEMFILE' => File.expand_path('Gemfile', __dir__) }, 'rails g spree_legacy_product_properties:install')
end
