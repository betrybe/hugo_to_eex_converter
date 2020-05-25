defmodule HugoToEexConverter.Shortcodes.RelrefOrRef do
  @content_dir "tmp/content/"

  def handle_path(path, file_path) do
    path = Regex.replace(~r/[\\""]/, path, "")

    do_handle_path(path, file_path)
  end

  def do_handle_path("/" <> path, _), do: "/course/#{path}"

  def do_handle_path("#" <> _ = anchor, _), do: anchor

  def do_handle_path(path, file_path) do
    relative_path =
      file_path
      |> Path.dirname()
      |> Path.relative_to(@content_dir)

    "/#{relative_path}/#{path}"
  end
end
