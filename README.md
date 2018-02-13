# Dropybara

This adds file drag and drop functionality to Capybara

No jQuery required

## Installation

Add to your Gemfile:
```
gem 'dropybara'
```

Then `bundle install`

Require it in your tests setup:
```
require 'dropybara'
```

## Usage

It takes similar arguments to `attach_file`

`page.drop_file(css_locator, path, *args)`

This uses `attach_file` under the hood, as such `path` and `*args` are passed directly to it.

### Example

```
page.drop_file('.drop-box', File.expand_path('upload.txt'))
```
