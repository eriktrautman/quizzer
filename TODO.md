# TODO

DONE Add CategoryQueue so user has a unique queue per category (since now users share a queue... bad!)
* Quiz Execution
  Selection form for categories (e.g. quizzes#new)
    DONE Creates new quiz 
    DONE populates the queue
      DONE Create the usercategoryqueue for each category if it doesn't aready exist
    DONE Current_question route to display the top of queue
    DONE Current_question view to pull up current card (not hidden yet)
    DONE Render markdown with current_question
    DONE Add index page for quick jump into a quiz
    DONE Add form for advancing to the next card via either pass or fail
    DONE Create backend for form to increment appropriate value and DONE shuffle card back into correct position of queue
    DONE Write javascript to show answer and disable show button when pushed
    Show the card's stats across the top
    Gussy up the UI for the current_card form
* Data Entry
  Card creation and edit forms (basic)
  Card creation/edit form backends
  Category Creation and edit forms (basic)
  Category creation/edit form backends
  High visibility creation / edit form
* Tests
  Make sure user can't create identical quizzes