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
      $('.product')
        .find('option')
        .remove()
      ;
      $('.product').append $('<option>',
        value: 0
        text: 'Please Select')
    else
      while i < arr_type.length
        if ("" + arr_type[i]['category_id']) == ("" + $(ev.currentTarget).val())
          x = x + 1
        $('#unit_' + i).val("")
        $('#request_request_lines_attributes_' + i + '_unit_id').val(0)
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
      $('.product')
        .find('option')
        .remove()
      ;
      $('.product').append $('<option>',
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
      $('#unit_' + count).val("")
      $('#request_request_lines_attributes_' + count + '_unit_id').val(0)
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
    product_unit_id = 0
    arr_unit = []
    arr_product = []
    arr_unit = $('.unit_info').data('unit')
    arr_product = $('.product_info').data('product')
    count = ev.currentTarget.id.match(/\d+/)[0]
    if $(ev.currentTarget).val() == ""
      $('#unit_' + count).val("")
      $('#request_request_lines_attributes_' + count + '_unit_id').val(0)
      $('#request_request_lines_attributes_' + count + '_product_id').val(0)
    else
      while x < arr_product.length
        if ("" + arr_product[x]['id']) == ("" + $('#product_' + count).val())
          product_unit_id = arr_product[x]['unit_id']
        x++
      while i < arr_unit.length
        if ("" + arr_unit[i]['id']) == ("" + product_unit_id)
          $('#unit_' + count).val(arr_unit[i]['name'])
          $('#request_request_lines_attributes_' + count + '_unit_id').val(arr_unit[i]['id'])
        i++
      $('#request_request_lines_attributes_' + count + '_product_id').val($(ev.currentTarget).val())
    console.log $('#product_' + count).val()

  $(window).load ->
    i = 0
    x = 0
    i = $('.type').length
    while x < i
      if $('#request_request_lines_attributes_' + x + '_type_id').val() == ""
      else
        $('#product_' + x).val($('#request_request_lines_attributes_' + x + '_product_id').val())
        $('#type_' + x).val($('#request_request_lines_attributes_' + x + '_type_id').val())
        console.log 'meron'
      x++
