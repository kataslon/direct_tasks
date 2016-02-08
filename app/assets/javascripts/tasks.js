jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });
  return this;
}

jQuery.fn.selectionDeadLine = function() {
  this.find('#datetimepicker').datetimepicker({
    locale: 'ru',
    format: 'DD/MM/YYYY'
  });
  return this;
}

$(function() {
  $('.edit_task').submitOnCheck();
});
