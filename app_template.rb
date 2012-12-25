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

# Exception Error Notice
gem "exception_notification"

# Development
gem_group :development do
  # Twitter Bootstrap
  gem 'twitter-bootstrap-scaffold'

  # Show Routing
  gem 'sextant'

  # Show Errors
  gem "better_errors"
  gem "binding_of_caller"
end

# Test AND Development
gem_group :development, :test do
  gem "sqlite3"
end

# Test
gem_group :test do
  gem 'rspec-rails'
end

# Production
gem_group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

#--------------#
# Insert Files #
#--------------#
# Ruby Version Insert
insert_into_file "Gemfile",
  "ruby '1.9.3'\n",
  after: "source 'https://rubygems.org'\n"

insert_into_file "Gemfile",
  "# OmniAuth\n",
  before: "gem \"omniauth-scaffold\"\n"

insert_into_file "Gemfile",
  "\n# Scaffold Template\n",
  before: "gem \"custom-template\"\n"

insert_into_file "Gemfile",
  "\n# Markdown\n",
  before: "gem \"markdown-scaffold\"\n"

insert_into_file "Gemfile",
  "\n# Utility\n",
  before: "gem \"action_args\"\n"

insert_into_file "Gemfile",
  "\n# App Server\n",
  before: "gem \"thin\"\n"

insert_into_file "Gemfile",
  "\n# Pagination\n",
  before: "gem \"kaminari\"\n"

insert_into_file "Gemfile",
  "\n# Settings\n",
  before: "gem \"rails_config\"\n"

insert_into_file "Gemfile",
  "\n# Colorful Logging\n",
  before: "gem \"rainbow\"\n"

insert_into_file "Gemfile",
  "\n# Dubug Tool\n",
  before: "gem \"tapp\"\n"

insert_into_file "Gemfile",
  "\n# Exception Error Notice\n",
  before: "gem \"exception_notification\"\n"

insert_into_file "Gemfile",
  "\n# Development\n",
  before: "group :development do\n"

insert_into_file "Gemfile",
  "# Test AND Development\n",
  before: "group :development, :test do\n"

insert_into_file "Gemfile",
  "# Test\n",
  before: "group :test do\n"

insert_into_file "Gemfile",
  "# Production\n",
  before: "group :production do\n"

# CommentOut
comment_lines 'Gemfile', "gem 'sqlite3'"
comment_lines 'Gemfile', "gem \"action_args\""

# Gem Install
run "bundle install --without production"
run "bundle update"
