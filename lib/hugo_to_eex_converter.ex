defmodule HugoToEExConverter do
  alias HugoToEExConverter.{Markdown, Shortcodes}

  def convert(glob \\ "tmp/convert/content/**/*.md") do
    glob
    |> Path.wildcard()
    |> Enum.each(&do_convert/1)
  end

  defp do_convert(file_path) do
    [info, content] = split_frontmatter_and_content(file_path)
    new_file_path = set_new_file_path(file_path)

    content = do_convert(new_file_path, content)

    create_file!(new_file_path, ".yaml", info)
    create_file!(new_file_path, ".html.md", content)
  end

  defp do_convert("", _), do: ""

  defp do_convert(path, content) do
    content
    |> Shortcodes.convert(path)
    |> Markdown.escape_forward_slashs_after_http_as_param()
    |> Markdown.replace_italic_underscore_syntax_to_asterisc()
  end

  defp split_frontmatter_and_content(file_path) do
    regex = ~r/^(?<frontmatter>(---\n(.*?)---)?)(\n*)(?<content>(.*))/ms

    %{"frontmatter" => f, "content" => c} = Regex.named_captures(regex, File.read!(file_path))

    [f, c]
  end

  defp set_new_file_path(file_path) do
    file_path
    |> String.replace("/convert/content/", "/converted/course/")
    |> String.split(~r/.md$/)
    |> List.first()
  end

  defp create_file!(_, ".yaml", ""), do: nil

  defp create_file!(file_path, extension, content) do
    file_path = file_path <> extension
    file_path_dir = Path.dirname(file_path)

    with :ok <- File.mkdir_p(file_path_dir) do
      File.write!(file_path, content)
    end
  end
end
