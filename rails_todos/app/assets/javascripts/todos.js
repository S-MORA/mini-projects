// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  if ($('body.todos.index').length == 0) {
    return;
  }

  $('.delete-todo').click(function(e) {
    e.preventDefault();
    let deletionURL = e.target.getAttribute('href');

    $.ajax({
      method: 'DELETE',
      url: deletionURL,
      success: function(data) {
        $(e.target).parents('.single-todo').remove();
        toastr.success('Your todo was DELETED!!!!!FOREVER')

      }
    });
  });
});