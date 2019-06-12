if defined?(Pry)
  # Hit enter key to repeat last command
  Pry::Commands.command(/^$/, 'repeat last command') do
    last_command = Pry.history.to_a.last
    unless ['c', 'continue', 'q', 'exit-program', 'quit'].include? last_command
      _pry_.run_command last_command
    end
  end
  # Single letter aliases for pry commands
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'q', 'exit-program'
  Pry.commands.alias_command 'quit', 'exit-program'
  # Turn off the automatic pager
  Pry.config.pager = false
end
