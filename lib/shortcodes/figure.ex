defmodule HugoToEExConverter.Shortcodes.Figure do
  alias HugoToEExConverter.{Shortcodes, Utils}

  def convert(params, file_path) do
    src = extract_src(params)

    params =
      params
      |> Shortcodes.Attrs.convert()
      |> handle_src(file_path, src)
      |> String.replace(~r/(`)/, "\\\\\\g{1}")

    "<%= figure(%{#{params}}) %>"
  end

  defp extract_src(params) do
    ~r/src="(.+?)"/
    |> Regex.run(params)
    |> List.last()
  end

  defp handle_src(params, _file_path, "http" <> _path), do: params

  defp handle_src(params, file_path, src) do
    path = Utils.Path.relative_to(src, file_path)

    String.replace(params, ~r/(src: ".+?")/, "src: \"#{path}\"")
  end
end
