//= require ckeditor/init_ckeditor
//= require frontend_editor/frontend_editor
//= require twitter/bootstrap
#Send the csrf token before an ajax send for rails
$.ajaxSetup
  beforeSend: (xhr, settings) ->
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    return if settings.crossDomain
    return if settings.type == "GET"
    if csrf_token
      xhr.setRequestHeader('X-CSRF-Token', csrf_token)

#Init the backbone application when jQuery is ready
$(document).ready ->
  FrontendEditor.init()
  publishButton = $('#publish-button')
  if(publishButton.length == 1)
    publishButton.on(
      'click',
      () ->
        if publishButton.hasClass('active')
          url = publishButton.data('publish-url')
          text = 'Unpublish'
        else
          url = publishButton.data('unpublish-url')
          text = 'Publish'
        $.ajax(url, type: 'PUT')
        publishButton.text(text)
    )
