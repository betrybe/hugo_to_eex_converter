defmodule HugoToEexConverter.Shortcodes.Figure do
  alias HugoToEexConverter.Shortcodes

  def convert(params, file_path) do
    params = Shortcodes.Attrs.convert(params)

    src = ~r/src: "(.+?)"/ |> Regex.run(params) |> List.last()

    if src =~ ~r/http.+?/ do
      params = Regex.replace(~r/(`)/, params, "\\\\\\g{1}")

      "<%= figure(%{#{params}}) %>"
    else
      dir = Path.dirname(file_path)

      relative_path =
        dir
        |> Path.join(src)
        |> Path.expand()
        |> String.split("/course")
        |> List.last()

      params = Regex.replace(~r/(`)/, params, "\\\\\\g{1}")
      params = Regex.replace(~r/(src: ".+?")/, params, "src: \"/course#{relative_path}\"")

      "<%= figure(%{#{params}}) %>"
    end
  end
end
