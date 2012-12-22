#----------------------#
# Application Template #
#----------------------#

# OmniAuth
gem 'omniauth-scaffold'

# Scaffold Template
gem 'custom-template'

# Markdown
gem 'markdown-scaffold'

# Utility
gem 'action_args'

# App Server
gem 'thin'

# Pagination
gem 'kaminari'

# Settings
gem 'rails_config'

# Colorful Logging(ANSI color)
gem 'rainbow'

# Dubug Tool
gem 'tapp'

# Deployment
gem_group :deployment do
  # Twitter Bootstrap
  gem 'twitter-bootstrap-scaffold'

  # Show Routing
  gem 'sextant'
end

# Test AND Deployment
gem_group :test, :development do
  gem "rspec-rails"
  gem 'sqlite3'
end

# Production
gem_group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

# CommentOut
comment_lines 'Gemfile', "gem 'sqlite3'"
comment_lines 'Gemfile', "gem 'action_args'"

# Ruby Version Insert
insert_into_file "Gemfile",
  "source \"https://rubygems.org\"\n",
  after: "ruby \"1.9.3\"\n"

# Gem Install
run "bundle install --without production"
