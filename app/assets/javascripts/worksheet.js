$(document).on('ready page:load', function () {
  $('a#add-objective').click(function() {
    var count = $('#objectives-list').children().length;
    $("div#objectives-list").append(
        "<div class='row'><div class='small-11 columns'>" +
        "<input placeholder='Objective description' type='text' name='worksheet[objectives_attributes][" +
        count + "][description]' id='worksheet_objectives_attributes_" + count + "_description'>" +
        "</div><a href='#' class='remove-item button tiny'>X</a>"
      )
    removeObjective();
  })

  $('a#add-question').click(function() {
    var count = $('div#questions-list').children().length;
    $("div#questions-list").append(
        "<div class='row'><div class='small-11 columns'>" +
        "<input placeholder='Question description' type='text' name='worksheet[questions_attributes][" +
        count + "][description]' id='worksheet_questions_attributes_" + count + "_description'>" +
        "</div><a href='#' class='remove-item button tiny'>X</a>"
      )
    removeQuestion();
  })

  function removeItem(path) {
    $("a.remove-item ").click(function() {
      var id = $(this).parent().attr('id');
      if (id != undefined) {
        $.ajax({
          url: '/' + path + '/' + id,
          type: 'DELETE',
        });
      }
      $(this).parent().remove();
    });
  }

  function removeObjective() {
    removeItem('objectives');
  }

  function removeQuestion() {
    removeItem('questions');
  }

  removeObjective();
  removeQuestion();

});
