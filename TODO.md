# TODO

Make a new quiz!
Edit a quiz!
Deploy to Heroku
LATER: UI: High visibility creation / edit form for cards
LATER: Create javascript listener to use "p" and "f" keys to advance
SOMEDAY: * Tests
  Make sure user can't create identical quizzes
  When you pass a card, its views should update properly
  When you fail a card, its views should update properly
  When you first start off, card views should be empty
  As soon as you pass a card, its card view should be created

DONE Change redirect for a new card to the new page
DONE Set cookie for last used category for card to autopopulate it
DONE Gussy up the UI for the data entry forms
DONE Gussy up the UI for the current_card form
DONE Go back and make sure the queue updates every time for new cards
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
