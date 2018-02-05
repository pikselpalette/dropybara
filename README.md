# Dropybara

This adds file drag and drop functionality to Capybara

No jQuery required

## Installation

Add to your Gemfile:
```
gem 'dropybara', git: 'git@gitlab.piksel.com:sam.boylett/dropybara.git'
```

Then `bundle install`

Require it in your tests setup:
```
require 'dropybara'
```

## Usage

It takes the same arguments as `attach_file`

`page.drop_file(css_locator, path, *args)`

This uses `attach_file` under the hood, as such `path` and `*args` are passed directly to it.

### Example

```
page.drop_file('.drop-box', File.expand_path('upload.txt'))
```
