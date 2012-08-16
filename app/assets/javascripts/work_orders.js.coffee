jQuery ->
  $("#button" ).click ->
    $next = $(this).next('#effect');
    $('#effect')
      .not($next)
      .slideUp("slow")
      .prev("#button" )
    $next.slideToggle("slow")




