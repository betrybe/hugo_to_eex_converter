defmodule HugoToEexConverter.Shortcodes.WithBlock do
  alias HugoToEexConverter.Shortcodes

  @regex ~r/{{< ?(.+?) ([^>]+) ?>}}\n(.+?)\n(?:{{< ?\/ ?(.+?) ?>}})/s

  def convert(file_content) do
    file_content = Regex.replace(@regex, file_content, &do_convert/4)

    Regex.replace(~r/, +?do %>/, file_content, " do %>")
  end

  defp do_convert(_, shortcode, params, details) do
    params = Shortcodes.Attrs.convert(params)
    new_shortcode = Shortcodes.shortcodes() |> Map.get(shortcode)

    "<%= #{new_shortcode}(%{#{params}}) do %>\n#{details}\n<% end %>"
  end
end
