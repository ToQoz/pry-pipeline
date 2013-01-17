# -*- coding: utf-8 -*-

class String
  def _pipe_(cmd);
    case cmd
    when Proc
      (cmd.call self.to_s).to_s
    when String
      Pry.run_command("#{cmd} #{self}")
    end
  end
  alias_method :|, :_pipe_
end

class Symbol
  def _pipe_(*args); to_s._pipe_(*args) end
  alias_method :|, :_pipe_
end
