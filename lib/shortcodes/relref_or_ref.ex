defmodule HugoToEExConverter.Shortcodes.RelrefOrRef do
  def handle_path(to) do
    Regex.replace(~r/[\\""]/, to, "")
  end
end
