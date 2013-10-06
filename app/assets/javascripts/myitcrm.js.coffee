jQuery ->
#  $('.dropdown-menu li > a').on 'click', ->
#    $('#user').removeClass('active')
##  $('ul.nav > li').removeClass('active')
#    $('#wo').addClass('active')
###$('.navbar li a').on 'click', (event) ->
#  $(this).parent('li').addClass('active')
  $thisLi = $(this).parent('li')
  $ul = $thisLi.parent('ul')
  if (!$thisLi.hasClass('active'))
    $ul.find('li.active').removeClass('active')
  $thisLi.addClass('active')
  event.preventDefault()###
