SimpleForm.setup do |config|
  config.wrappers :default, class: 'form-group', error_class: :field_with_errors do |b|
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.optional :label

    b.use :html5
    b.use :placeholder
    b.use :input, class: 'form-control floating-label col-lg-12 input-lg'
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }
  end

  config.wrappers :boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'togglebutton' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :radio, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: :div, class: 'radio radio-primary' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :checkbox, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: :div, class: 'checkbox checkbox-primary' do |ba|
      ba.use :label_input, class: 'checkbox'
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :submit do |b|
    b.use :input, class: 'btn btn-primary'
  end

  config.default_wrapper = :default
  config.boolean_style = :nested
  config.button_class = 'btn btn-primary btn-raised'
  config.error_notification_tag = :div
  config.error_notification_class = 'alert alert-danger'
  config.browser_validations = true
  #config.boolean_label_class = nil

  config.wrapper_mappings = {
    boolean: :boolean,
    check_boxes: :checkbox,
    radio_buttons: :radio,
    submit: :submit,
  }
end
