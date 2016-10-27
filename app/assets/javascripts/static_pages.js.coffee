$ ->
  $(".region_label").on 'click', (e) ->
    $(this).parent("div").parent("div").find(".active").removeClass("active")
    $(this).addClass("active")
    $(this).next().prop('checked', true)
