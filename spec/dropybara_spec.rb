require_relative '../lib/dropybara.rb'

describe :drop_file, js: true do
  before :each do
    visit 'index.html'
  end

  it 'can drop a file on an element' do
    page.drop_file '#dropzone', File.expand_path('spec/files/upload.txt')

    expect(page).to have_content 'upload.txt'
  end
end
