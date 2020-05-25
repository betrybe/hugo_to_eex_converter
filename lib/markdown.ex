defmodule HugoToEExConverter.Markdown do
  def replace_italic_underscore_syntax_to_asterisc(content) do
    Regex.replace(~r/\s_([\w-ú]+)_([\s\.!?])?/u, content, " *\\g{1}*\\g{2}")
  end

  def escape_forward_slashs_after_http_as_param(content) do
    Regex.replace(~r/(: ?"http[s|]:)\/\/(.+?")/s, content, "\\g{1}\\/\\/\\g{2}")
  end
end
