defmodule HugoToEExConverter do
  alias HugoToEExConverter.{Markdown, Shortcodes, Utils}

  @source System.get_env("INPUT_STORAGEPATH")

  def convert(source \\ @source) do
    Utils.File.create_converted_folder!(source)

    "#{source}/content/**/*.md"
    |> Path.wildcard()
    |> Enum.map(fn f -> Task.async(fn -> do_convert(f) end) end)
    |> Task.yield_many(:infinity)
  end

  defp do_convert(file_path) do
    [info, content] = split_frontmatter_and_content(file_path)
    new_file_path = set_new_file_path(file_path)

    content = do_convert(new_file_path, content)

    Utils.File.write(info, new_file_path, ".yaml")
    Utils.File.write(content, new_file_path, ".html.md")
  end

  defp do_convert("", _), do: ""

  defp do_convert(path, content) do
    content
    |> Shortcodes.convert(path)
    |> Markdown.convert()
  end

  defp split_frontmatter_and_content(file_path) do
    regex = ~r/^(?<frontmatter>(---\n(.*?)---)?)(\n*)(?<content>(.*))/ms

    %{"frontmatter" => f, "content" => c} = Regex.named_captures(regex, File.read!(file_path))

    [f, c]
  end

  defp set_new_file_path(file_path) do
    file_path
    |> String.replace("/convert/", "/converted/priv/markdown_templates/")
    |> String.split(~r/.md$/)
    |> List.first()
  end
end
