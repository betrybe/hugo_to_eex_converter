defmodule HugoToEExConverter.Shortcodes.Extlink do
  alias HugoToEExConverter.Shortcodes

  @regex ~r/(href|text): ?"(.+?)", (href|text): ?"(.+?)",/

  def convert(params) do
    params = Shortcodes.Attrs.convert(params)

    Regex.replace(@regex, params, &do_convert/5)
  end

  defp do_convert(_match, "href", g2, _g3, g4) do
    text = escape_double_quotes(g4)

    "[#{text}](#{g2}) {: .external-link target=\"_blank\" rel=\"noreferrer noopener\" }"
  end

  defp do_convert(_match, "text", g2, _g3, g4) do
    text = escape_double_quotes(g2)

    "[#{text}](#{g4}) {: .external-link target=\"_blank\" rel=\"noreferrer noopener\" }"
  end

  defp escape_double_quotes(str) do
    String.replace(str, ~S{\"}, "\"")
  end
end
