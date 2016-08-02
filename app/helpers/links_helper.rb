module LinksHelper
  def link_to_destroy(*args)
    options = args.extract_options!

    options[:data]           ||= {}
    options[:data][:method]  ||= :delete
    options[:data][:confirm] ||= t('messages.confirmation')

    link_with_icon({ action: 'destroy', icon: 'fa-trash' }, *(args << options))
  end

  def link_to_show *args
    link_with_icon({ action: 'show', icon: 'fa-search' }, *args)
  end

  def link_to_edit *args
    link_with_icon({ action: 'edit', icon: 'fa-pencil' }, *args)
  end

  private

    def link_with_icon(options = {}, *args)
      arg_options = args.extract_options!
      title = options.fetch(:title) { t("label.#{options.fetch(:action)}") }

      arg_options.reverse_merge! title: title, class: 'icon'

      link_to *args, arg_options do
        content_tag :span, nil, class: "fa #{options.fetch(:icon)}"
      end
    end
end
