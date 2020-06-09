defmodule HugoToEExConverter.Shortcodes.Attrs do
  @regex ~r/(\w+)=(".*?")/

  def convert(content) do
    Regex.replace(@regex, content, "\\g{1}: \\g{2},")
  end
end
