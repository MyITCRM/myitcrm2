jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('tr').hide()
    event.preventDefault()

  $('form').on 'click', '.services', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#lines tr:last').after($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.products', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#lines2 tr:last').after($(this).data('fields').replace(regexp, time))
    event.preventDefault()
