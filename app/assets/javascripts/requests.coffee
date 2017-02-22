# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  arr = []
  $('.request_id').on 'click', (ev) ->
    arr = $('input:checked').valList()
    console.log $('input:checked').valList()
    $('#request_ids').val(arr)
    @request_list = arr

  (($) ->

    $.fn.valList = ->
      $.map(this, (elem) ->
        elem.value or ''
      )

    return
  ) jQuery

  $('#request_category_id').on 'change', (ev) ->
    i = 0
    x = 0
    y = 0
    z = 0
    j = 0
    arr_type = []
    type = []
    arr_type = $('.type_info').data('type')
    if $(ev.currentTarget).val() == ""
      $('.type')
        .find('option')
        .remove()
      ;
      $('.type').append $('<option>',
        value: 0
        text: 'Please Select')
    else
      while i < arr_type.length
        if ("" + arr_type[i]['category_id']) == ("" + $(ev.currentTarget).val())
          x = x + 1
        i++
      type.length =  x
      while y < i
        if ("" + arr_type[y]['category_id']) == ("" + $(ev.currentTarget).val())
          type[z] = arr_type[y]
          z = z + 1
        y++
      $('.type')
        .find('option')
        .remove()
      ;
      $('.type').append $('<option>',
        value: 0
        text: 'Please Select')
      while j < z
        $('.type').append $('<option>',
            value: type[j]['id']
            text: type[j]['name'])
        j++

  $('.type').on 'change', (ev) ->
    i = 0
    x = 0
    y = 0
    z = 0
    j = 0
    arr_product = []
    product = []
    arr_product = $('.product_info').data('product')
    count = ev.currentTarget.id.match(/\d+/)[0]
    if $(ev.currentTarget).val() == ""
      $('#product_' + count)
        .find('option')
        .remove()
      ;
      $('#product_' + count).append $('<option>',
        value: 0
        text: 'Please Select')
      $('#request_request_lines_attributes_' + count + '_type_id').val(0)
    else
      while i < arr_product.length
        if ("" + arr_product[i]['type_id']) == ("" + $(ev.currentTarget).val())
          x = x + 1
        i++
      product.length =  x
      while y < i
        if ("" + arr_product[y]['type_id']) == ("" + $(ev.currentTarget).val())
          product[z] = arr_product[y]
          z = z + 1
        y++
      $('#product_' + count)
        .find('option')
        .remove()
      ;
      $('#product_' + count).append $('<option>',
        value: 0
        text: 'Please Select')
      while j < z
        $('#product_' + count).append $('<option>',
            value: product[j]['id']
            text: product[j]['name'])
        j++
      $('#request_request_lines_attributes_' + count + '_type_id').val($(ev.currentTarget).val())

  $('.product').on 'change', (ev) ->
    i = 0
    x = 0
    y = 0
    z = 0
    j = 0
    arr_unit = []
    arr_unit = $('.unit_info').data('unit')
    count = ev.currentTarget.id.match(/\d+/)[0]
    if $(ev.currentTarget).val() == ""
      $('#unit_' + count).val(0)
      $('#request_request_lines_attributes_' + count + '_unit_id').val(0)
      $('#request_request_lines_attributes_' + count + '_product_id').val(0)
    else
      while i < arr_unit.length
        if ("" + arr_unit[i]['unit_id']) == ("" + $(ev.currentTarget).val())
          $('#unit_' + count).val(arr_unit[i]['name'])
          $('#request_request_lines_attributes_' + count + '_unit_id').val(arr_unit[i]['unit_id'])
        i++
      $('#request_request_lines_attributes_' + count + '_product_id').val($(ev.currentTarget).val())


