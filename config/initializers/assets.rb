# Version of your assets, change this if you want to expire all your assets.
Rails.application.configure do
  config.assets.version = '1.0'
  config.assets.precompile += %w( *.svg *.eot *.woff *.ttf *.woff2 )
end
