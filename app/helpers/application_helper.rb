module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def show_menu_link(options = {})
    name = t("menu.#{options[:name]}")
    classes = []

    classes << 'active' if [*options[:controllers]].include?(controller_name)

    content_tag(
      :li, link_to(name, options[:path]),
      class: (classes.empty? ? nil : classes.join(' '))
    )
  end

  def show_button_dropdown(main_action, extra_actions = [], options = {})
    if extra_actions.blank?
      main_action
    else
      out = ''.html_safe

      out << render(
        partial: 'shared/button_dropdown', locals: {
          main_action: main_action, extra_actions: extra_actions
        }
      )
    end
  end

  def iconic_link(options = {}, *args)
    opts = args.extract_options!

    opts['data-show-tooltip'] ||= true
    opts['title'] ||= options['title']

    link_to *args, opts do
      content_tag :span, nil, class: "glyphicon #{options['icon']}"
    end
  end

  def link_to_show(*args)
    options = args.extract_options!

    options['title'] ||= t('label.show')
    options['icon']  ||= 'glyphicon-search'

    iconic_link options, *args
  end

  def link_to_edit(*args)
    options = args.extract_options!

    options['title'] ||= t('label.edit')
    options['icon']  ||= 'glyphicon-pencil'

    iconic_link options, *args
  end

  def link_to_destroy(*args)
    options = args.extract_options!

    options['title'] ||= t('label.delete')
    options['method'] ||= :delete
    options['data-confirm'] ||= t('messages.confirmation')
    options['icon']  ||= 'glyphicon-trash'

    iconic_link options, *args
  end
end
