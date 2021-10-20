defmodule HugoToEExConverter.Markdown do
  def convert(content) do
    content
    |> replace_tag_id_definition()
    |> escape_forward_slashs_after_http_as_param()
    |> escape_eex_tags_between_backticks()
  end

  defp replace_tag_id_definition(content) do
    Regex.replace(~r/\s?{\s?#(\w+)\s?}/, content, ~s|\n{: id="\\g{1}" }|)
  end

  defp escape_forward_slashs_after_http_as_param(content) do
    Regex.replace(
      ~r/(\\```|```([^```])*```|(\+))(*SKIP)(*FAIL)|(: ?"http[s|]:)\/\/(.+?")/s,
      content,
      "\\g{4}\\/\\/\\g{5}"
    )
  end

  defp escape_eex_tags_between_backticks(content) do
    Regex.replace(~r/`(<%)(=)?`/s, content, "`\\g{1}%\\g{2}`")
  end
end
