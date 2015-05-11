old_handler = I18n.config.exception_handler

I18n.config.exception_handler = lambda do |exception, locale, key, options|
  p locale, key, options
  old_handler.call(exception, locale, key, options)
end

I18n.config.enforce_available_locales = true
