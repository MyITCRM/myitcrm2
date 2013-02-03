jQuery ->
  $("#button" ).click ->
      $('#effect').slideToggle("slow")
  $("#button_task" ).click ->
      $('#effect_task').slideToggle("slow")

  $("#work_order_description").textilize()
#  $("#work_order_resolution").textilize()
