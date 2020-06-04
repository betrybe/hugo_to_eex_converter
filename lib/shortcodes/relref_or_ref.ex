defmodule HugoToEExConverter.Shortcodes.RelrefOrRef do
  def handle_path(to, file_path) do
    to = Regex.replace(~r/[\\""]/, to, "")

    do_handle_path(to, file_path)
  end

  def do_handle_path("/" <> to, _), do: "/course/#{to}"

  def do_handle_path("#" <> _ = anchor, _), do: anchor

  def do_handle_path(to, file_path) do
    content_dir = String.split(file_path, "/course/") |> List.first()

    relative_path =
      file_path
      |> Path.dirname()
      |> Path.relative_to(content_dir)

    "/#{relative_path}/#{to}"
  end
end
