defmodule HugoToEExConverter.Shortcodes.Extlink do
  alias HugoToEExConverter.Shortcodes

  @regex ~r/(href|text): ?"(.+?)", (href|text): ?"(.+?)",/

  def convert(params) do
    params = Shortcodes.Attrs.convert(params)

    Regex.replace(@regex, params, &do_convert/5)
  end

  defp do_convert(_match, "href", g2, _g3, g4) do
    "[#{g4}](#{g2}) {: .external-link target=\"_blank\" rel=\"noreferrer noopener\" }"
  end

  defp do_convert(_match, "text", g2, _g3, g4) do
    "[#{g2}](#{g4}) {: .external-link target=\"_blank\" rel=\"noreferrer noopener\" }"
  end
end
