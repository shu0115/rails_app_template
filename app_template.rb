#----------------------#
# Application Template #
#----------------------#

=begin
repo_url = "https://raw.github.com/tachiba/rails3_template/master"
gems = {}

@app_name = app_name

def get_and_gsub(source_path, local_path)
  get source_path, local_path

  gsub_file local_path, /%app_name%/, @app_name
  gsub_file local_path, /%app_name_classify%/, @app_name.classify
  gsub_file local_path, /%working_user%/, @working_user
  gsub_file local_path, /%working_dir%/, @working_dir
  #gsub_file local_path, /%remote_repo%/, @remote_repo if @remote_repo
end

def gsub_database(localpath)
  return unless @mysql

  gsub_file localpath, /%database_name%/, @mysql[:database_name] ? @mysql[:database_name] : @app_name

  gsub_file localpath, /%mysql_username_development%/, @mysql[:username_development]
  gsub_file localpath, /%mysql_remote_host_development%/, @mysql[:remote_host_development]

  gsub_file localpath, /%mysql_username_production%/, @mysql[:username_production]
  gsub_file localpath, /%mysql_password_production%/, @mysql[:password_production]
  gsub_file localpath, /%mysql_remote_host_production%/, @mysql[:remote_host_production]
end
=end

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
insert_into_file
  "Gemfile",
  "source \"https://rubygems.org\"\n",
  after: "ruby \"1.9.3\"\n"

# Gem Install
run "bundle install"
