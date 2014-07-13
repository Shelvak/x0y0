jQuery ($)->
  $(document).on 'focus keydown click', 'input[data-date-picker]', ->
    $(this).datepicker
      showOn: 'both',
      onSelect: -> $(this).datepicker('hide')
    .removeAttr('data-date-picker').focus()

  $(document).on 'focus keydown click', 'input[data-datetime-picker]', ->
    $(this).datetimepicker
      showOn: 'both',
      stepHour: 1,
      stepMinute: 5
    .removeAttr('data-datetime-picker').focus()
