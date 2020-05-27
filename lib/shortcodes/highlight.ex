defmodule HugoToEExConverter.Shortcodes.Highlight do
  @regex ~r/\s*?{{<\s?highlight (\w+)?\s?([^>\s]+)? ?>}}\n?(.+?)\n(?:\s*?{{<\s?\/\s?highlight\s?>}})/s

  def convert(file_content) do
    Regex.replace(@regex, file_content, &do_convert/4)
  end

  defp do_convert(_, "", "\"linenos=inline\"", inner_content) do
    "\n\n```\n#{escape_eex_tags(inner_content)}\n```\n{: .line-numbers}"
  end

  defp do_convert(_, "", "", inner_content) do
    "\n\n```\n#{escape_eex_tags(inner_content)}\n```\n"
  end

  defp do_convert(_, lang, "\"linenos=inline\"", inner_content) do
    "\n\n```language-#{lang}\n#{escape_eex_tags(inner_content)}\n```\n{: .line-numbers}"
  end

  defp do_convert(_, lang, _g2, inner_content) do
    "\n\n```language-#{lang}\n#{escape_eex_tags(inner_content)}\n```"
  end

  defp escape_eex_tags(inner_content) do
    Regex.replace(~r/(<%)/s, inner_content, "\\g{1}%")
  end
end
