# Version of your assets, change this if you want to expire all your assets.
Rails.application.configure do
  config.assets.version = '1.0'
  config.assets.precompile << %r(Material-Design-Icons\.(?:eot|svg|ttf|woff2?)$)
  config.assets.precompile << %r(RobotoDraft[\w-]+\.(?:eot|svg|ttf|woff2?)$)
end
