defmodule HugoToEExConverter.Utils.Path do
  def relative_to(path, file_path) do
    relative_to =
      file_path
      |> Path.dirname()
      |> String.split("content")
      |> List.last()

    Path.expand(path, relative_to)
  end
end
