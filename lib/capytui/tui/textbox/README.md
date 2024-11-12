# Capytui Textbox

This is a primitive text box component. It is currently a single line
and has very limited functionality and poor performance.

If you would like to edit something more complex/non-ephemeral, consider
instead programmatically opening a proper text editor / some other alternative.

## TODO.

- Consider supporting a multi-line text box
- Consider being able to move the cursor around (currently you can only type at the end.)
- Consider making character insertions more performant by using something like a rope.
- Consider supporting more complex editor functionality like an undo stack...
- Consider physically moving the terminal cursor around as you type. (this is
  a minor thing - technically the current cursor is not the real cursor so if
  you ctrl+b + [ in tmux, the cursor won't be wherever your fake capytui "cursor"
  currently is.)
