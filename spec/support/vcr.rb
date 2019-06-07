require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

 # In recorded cassettes, replace these environment variable values with a
  # placeholder like <VARIABLE>
  placeholders = %w[
    CLIENT_ID
    CLIENT_SECRET
  ]

  placeholders.each do |placeholder|
    c.filter_sensitive_data("<#{placeholder}>") { ENV[placeholder] }
  end


end