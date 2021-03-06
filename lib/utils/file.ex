defmodule HugoToEExConverter.Utils.File do
  def create_converted_folder!(source) do
    source
    |> String.replace("convert", "converted")
    |> File.mkdir_p!()
  end

  def write("", _, ".yaml"), do: nil

  def write(content, file_path, ".yaml" = extension) do
    content
    |> append_course_flag()
    |> do_write(file_path <> extension)
  end

  def write(content, file_path, ".html.md" = extension) do
    do_write(content, file_path <> extension)
  end

  defp do_write(content, file_path) do
    file_path_dir = Path.dirname(file_path)

    with :ok <- File.mkdir_p(file_path_dir),
         :ok <- File.write(file_path, content) do
      IO.puts("Created file #{file_path}")
    else
      {:error, reason} ->
        IO.puts("Error creating file: #{file_path}. Reason: #{reason}")
    end
  end

  defp append_course_flag(content) do
    content =
      content
      |> String.split("---")
      |> List.to_string()

    "---#{content}course: true\n---"
  end
end
