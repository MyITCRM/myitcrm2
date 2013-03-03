jQuery ->
  $('#invoice_due_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('tr').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#lines tr:last').after($(this).data('fields').replace(regexp, time))
    event.preventDefault()
