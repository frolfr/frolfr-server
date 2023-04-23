# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'pundit/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
Dir.glob('spec/steps/**/*steps.rb') { |f| load f, true }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Adds FactoryBot methods
  config.include FactoryBot::Syntax::Methods

  config.include RequestHelper, type: :request

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.order = :random
  #
  #   # Seed global randomization in this process using the `--seed` CLI option.
  #   # Setting this allows you to use `--seed` to deterministically reproduce
  #   # test failures related to randomization by passing the same `--seed` value
  #   # as the one that triggered the failure.
  #   Kernel.srand config.seed
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

# Geocoder should stub out Google API
Geocoder.configure(lookup: :test)

Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'latitude' => 40.7143528,
      'longitude' => -74.0059731,
      'address' => 'New York, NY, USA',
      'state' => 'New York',
      'state_code' => 'NY',
      'country' => 'United States',
      'country_code' => 'US'
    }
  ]
)
