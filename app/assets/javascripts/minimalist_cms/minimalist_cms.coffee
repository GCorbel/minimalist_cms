//= require ckeditor/init_ckeditor
//= require frontend_editor/frontend_editor

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
