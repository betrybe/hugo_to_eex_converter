defmodule HugoToEExConverter.Shortcodes.RelrefOrRef do
  alias HugoToEExConverter.Utils

  def handle_path(path, file_path) do
    path = Regex.replace(~r/[\\""]/, path, "")

    do_handle_path(path, file_path)
  end

  def do_handle_path("/" <> _ = to, _), do: to

  def do_handle_path("#" <> _ = anchor, _), do: anchor

  def do_handle_path(path, file_path) do
    Utils.Path.relative_to(path, file_path)
  end
end
