# Dropybara

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gem Version](https://badge.fury.io/rb/dropybara.svg)](https://badge.fury.io/rb/dropybara)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fde13facdcb24e6aa4bab1d3cda7fcba)](https://www.codacy.com/app/samboylett/dropybara?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=pikselpalette/dropybara&amp;utm_campaign=Badge_Grade)

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
