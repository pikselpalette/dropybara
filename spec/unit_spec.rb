require_relative '../lib/dropybara.rb'

describe Capybara::Session do
  before do
    @session = Capybara::Session.new
  end

  it 'responds to `drop_file`' do
    expect(@session).to respond_to(:drop_file)
  end
end
