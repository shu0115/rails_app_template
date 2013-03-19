# インストールGem
gem 'omniauth-scaffold'
gem 'custom-template'
gem 'markdown-scaffold'
gem 'action_args'
gem 'html5_validators'
gem 'thin'
gem 'puma'
gem 'kaminari'
gem 'rails_config'
gem 'rainbow'
gem 'tapp'
gem 'awesome_print'
gem 'i18n_generators'
gem "exception_notification"

# Development
gem_group :development do
  gem 'twitter-bootstrap-scaffold'
  gem 'sextant'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'meta_request', '0.2.0'
  gem "certified"
  gem "heroku_san"
  gem "rails_best_practices"
  gem 'pry-rails'
end

# Development AND Test
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

# ファイル内挿入
# Ruby Version Insert
insert_into_file "Gemfile",
#  "ruby '1.9.3'\n",
  "ruby '2.0.0'\n",
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
  "\n# Translation\n",
  before: "gem \"i18n_generators\"\n"

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

content = "\n\n"
content += "  # メールテスト用\n"
content += "  config.action_mailer.delivery_method = :smtp\n"
content += "  config.action_mailer.raise_delivery_errors = true\n"
content += "  config.action_mailer.smtp_settings = {\n"
content += "    address:              \"smtp.gmail.com\",\n"
content += "    port:                 587,\n"
content += "    user_name:            \"rails.dev0115@gmail.com\",\n"
content += "    password:             Settings.mail_password,\n"
content += "    authentication:       'plain',\n"
content += "    enable_starttls_auto: true,\n"
content += "  }\n"
content += "\n"
content += "  # エラー通知\n"
content += "  Rails.application.config.middleware.use(\n"
content += "    ExceptionNotifier,\n"
content += "    email_prefix:         \"[\#{Rails.env}][\#{Settings.app_name}] \",\n"
content += "    sender_address:       \"rails.dev0115@gmail.com\",\n"
content += "    exception_recipients: [ \"rails.dev0115@gmail.com\" ]\n"
content += "  )"
insert_into_file "config/environments/production.rb",
  content.force_encoding('ASCII-8BIT'),
  before: "\nend\n"

# CommentOut
comment_lines 'Gemfile', "gem 'sqlite3'"

# Gem Install
run "bundle install --without production"
run "bundle update"

# Generate Command
run "rails generate heroku_san"
