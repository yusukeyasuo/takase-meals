# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( calendar.css calendar.js )
Rails.application.config.assets.precompile += %w( complete.css complete.js )
Rails.application.config.assets.precompile += %w( login.css login.js )
Rails.application.config.assets.precompile += %w( loginafter.css loginafter.js )
Rails.application.config.assets.precompile += %w( order.css order.js )
Rails.application.config.assets.precompile += %w( orderedit.css orderedit.js )
Rails.application.config.assets.precompile += %w( ordering.css ordering.js )
Rails.application.config.assets.precompile += %w( ordernew.css ordernew.js )
Rails.application.config.assets.precompile += %w( passwordnew.css passwordnew.js )
Rails.application.config.assets.precompile += %w( passwordresend.css passwordresend.js )
Rails.application.config.assets.precompile += %w( top.css top.js )
