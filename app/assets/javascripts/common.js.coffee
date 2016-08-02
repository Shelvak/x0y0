jQuery ($) ->
  $(document).on 'click', 'a.submit', -> $('form').submit(); false

  $(document).ajaxStart ->
    $('.loading-caption').removeClass('hidden')
  .ajaxStop ->
    $('.loading-caption').addClass('hidden')

  $(document).on 'submit', 'form', ->
    $(this).find('input[type="submit"], input[name="utf8"]').attr 'disabled', true
    $(this).find('a.submit').removeClass('submit').addClass('disabled')
    $(this).find('.dropdown-toggle').addClass('disabled')

  $(document).on 'focus keydown click', 'input[data-date-picker]', ->
    $input = $(this)
    format = $input.data('dateTime') ? 'L LT' : 'L'
    locale = {
      format:      format,
      applyLabel:  $input.data('dateLocaleApply'),
      cancelLabel: $input.data('dateLocaleCancel')
    }
    options = {
      locale:              locale,
      autoApply:           true,
      singleDatePicker:    !  $input.data('dateRange'),
      timePicker:          !! $input.data('dateTime'),
      timePicker24Hour:    true,
      timePickerIncrement: 5
    }

    $input
      .daterangepicker(options)
      .removeAttr('data-date-picker')
      .focus()
