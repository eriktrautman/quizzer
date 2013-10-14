# TODO

Gussy up the UI for the current_card form
Gussy up the UI for the data entry forms
UI: High visibility creation / edit form for cards
Deploy to Heroku
* Tests
  Make sure user can't create identical quizzes
  When you pass a card, its views should update properly
  When you fail a card, its views should update properly
  When you first start off, card views should be empty
  As soon as you pass a card, its card view should be created

DONE Data Entry
  DONE Card creation and edit forms (basic)
  DONE Card creation/edit form backends
  DONE Category Creation and edit forms (basic)
  DONE Category creation/edit form backends
DONE Add CategoryQueue so user has a unique queue per category (since now users share a queue... bad!)
DONE Quiz Execution
  DONE Selection form for categories (e.g. quizzes#new)
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
    DONE Show the card's stats across the top
