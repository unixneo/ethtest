DEBUG = false #unless const_defined?(:DEBUG)

# removed db for public repo
USE_DB = true #unless const_defined?(:USE_DB)

require "#{Rails.root}/lib/assets/modules/endpoints.rb"
require "#{Rails.root}/lib/assets/modules/wallets.rb"
    