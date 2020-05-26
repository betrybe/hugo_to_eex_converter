defmodule HugoToEExConverter do
  alias HugoToEExConverter.{Markdown, Shortcodes}

  def content_dir, do: "course"


  def convert do
    "course/**/*.md"
    |> Path.wildcard()
    |> Enum.each(fn f -> Task.async(fn -> convert(f) end) end)
  end

  def convert(file_path) do
    regex = ~r/^(?<frontmatter>(---\n(.*?)---)?)(\n*)(?<content>(.*))/ms

    %{
      "frontmatter" => frontmatter,
      "content" => content
    } = Regex.named_captures(regex, File.read!(file_path))

    [file_name, _] = String.split(file_path, ~r/.md$/)
    file_name = Regex.replace(~r/_(index)$/, file_name, "\\g{1}")

    create_frontmatter!(file_name, frontmatter)

    File.write!("#{file_name}.html.md", do_convert(content, file_path))
    File.rm!(file_path)
  end

  def create_frontmatter!(_path, ""), do: nil

  def create_frontmatter!(path, content) do
    File.write!(path <> ".yaml", content)
  end

  defp do_convert("", _), do: ""

  defp do_convert(content, path) do
    content
    |> Shortcodes.convert(path)
    |> Markdown.escape_forward_slashs_after_http_as_param()
    |> Markdown.replace_italic_underscore_syntax_to_asterisc()
  end
end
