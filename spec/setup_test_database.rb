# frozen_string_literal: true

require 'pg'
require 'web_helper'
def setup_test_database
  p 'Setting up test database...'

  set_environment

  @connection.exec('TRUNCATE bookmarks;')
end
