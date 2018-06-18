require_relative '../lib/dropybara.rb'

describe Capybara::Session do
  it 'has `drop_file` defined' do
    expect(Capybara::Session.new).to respond_to('drop_file')
  end
end
