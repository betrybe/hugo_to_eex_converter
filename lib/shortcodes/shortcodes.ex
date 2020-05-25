defmodule HugoToEExConverter.Shortcodes do
  alias __MODULE__

  @shortcodes %{
    "extlink" => "extlink",
    "yt" => "youtube_video",
    "ytp" => "youtube_playlist",
    "vm" => "vimeo",
    "next-btn" => "next_button",
    "who-am-i" => "whoami",
    "figure" => "figure",
    "versioning-your-code" => "versioning_your_code"
  }

  def shortcodes, do: @shortcodes

  def convert(file_content, file_path) do
    file_content =
      file_content
      |> Shortcodes.Highlight.convert()
      |> Shortcodes.WithBlock.convert()

    func = fn _, shortcode, params ->
      do_convert(shortcode, params, file_path)
    end

    content = Regex.replace(~r/{{<\s?(.+?) (.+?)?\s?>}}/, file_content, func)

    Regex.replace(~r/\s?,\s?(}\)|\s\s?%>)/, content, "\\g{1}")
  end

  defp do_convert(shortcode, param, file_path) when shortcode in ~w(relref ref) do
    Shortcodes.RelrefOrRef.handle_path(param, file_path)
  end

  defp do_convert("extlink", params, _) do
    Shortcodes.Extlink.convert(params)
  end

  defp do_convert("figure", params, file_path) do
    Shortcodes.Figure.convert(params, file_path)
  end

  defp do_convert(shortcode, "id=" <> id, _path)
       when shortcode == "yt" or shortcode == "ytd" or shortcode == "vm" do
    new_shortcode = Map.get(@shortcodes, shortcode, shortcode)

    "<%= #{new_shortcode} #{id} %>"
  end

  defp do_convert(shortcode, "" = _params, _path) do
    new_shortcode = Map.get(@shortcodes, shortcode, shortcode)

    "<%= #{new_shortcode}() %>"
  end

  defp do_convert(shortcode, params, _path) do
    params = Shortcodes.Attrs.convert(params)
    new_shortcode = Map.get(@shortcodes, shortcode, shortcode)

    "<%= #{new_shortcode}(%{#{params}}) %>"
  end
end
