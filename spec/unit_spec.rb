require_relative '../lib/dropybara.rb'

describe Capybara::Session do
  it 'responds to `drop_file`' do
    expect(Capybara::Session.new).to respond_to(:drop_file)
  end
end
