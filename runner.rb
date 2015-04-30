require_relative 'editor'

editor = Editor.new

loop {
  begin
    print Editor::PROMPT
    input = gets.strip
    editor.get_command(input)
    editor.execute_command
  rescue *Editor::ERRORS => e
    puts e.message
  end
}
