defmodule HugoToEExConverter do
  alias HugoToEExConverter.{Markdown, Shortcodes}



  def convert do
    "tmp/convert/course/**/*.md"
    |> Path.wildcard()
    |> Enum.each(fn f -> Task.async(fn -> convert(f) end) end)
  end

  def convert(file_to_convert_path) do
    regex = ~r/^(?<frontmatter>(---\n(.*?)---)?)(\n*)(?<content>(.*))/ms

    %{
      "frontmatter" => frontmatter,
      "content" => content
    } = Regex.named_captures(regex, File.read!(file_to_convert_path))

    [new_file_path, _] =
      file_to_convert_path
      |> String.replace("/convert/", "/converted/")
      |> String.split(~r/.md$/)

    create_frontmatter!(new_file_path, frontmatter)

    content = do_convert(content, new_file_path)

    with :ok <- File.mkdir_p(Path.dirname("#{new_file_path}.html.md")) do
      File.write!("#{new_file_path}.html.md", content)
    end
  end

  def create_frontmatter!(_path, ""), do: nil

  def create_frontmatter!(path, content) do
    with :ok <- File.mkdir_p(Path.dirname(path <> "yaml")) do
      File.write!(path <> ".yaml", content)
    end
  end

  defp do_convert("", _), do: ""

  defp do_convert(content, path) do
    content
    |> Shortcodes.convert(path)
    |> Markdown.escape_forward_slashs_after_http_as_param()
    |> Markdown.replace_italic_underscore_syntax_to_asterisc()
  end
end
