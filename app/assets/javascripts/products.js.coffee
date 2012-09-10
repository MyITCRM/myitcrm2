jQuery ->
  $('#product_product_category_name').autocomplete
    source: $('#product_product_category_name').data('autocomplete-source')
