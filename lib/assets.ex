defmodule HugoToEExConverter.Assets do
  @source System.get_env("INPUT_STORAGEPATH")

  def copy(source \\ @source) do
    "#{source}/**/*.{png,jpeg,jpg,gif,svg,pdf,sql,zip,json,js,txt}"
    |> Path.wildcard()
    |> Stream.map(&set_new_file_path/1)
    |> Enum.each(&do_copy/1)
  end

  defp do_copy([file_path, new_file_path]) do
    content = File.read!(file_path)
    dir = Path.dirname(new_file_path)

    with :ok <- File.mkdir_p(dir),
         :ok <- File.write(new_file_path, content) do
      IO.puts("Copied file: #{new_file_path}")
    else
      {:error, reason} ->
        IO.puts("Error copying file: #{new_file_path}. Reason: #{reason}")
    end
  end

  defp set_new_file_path(file_path) do
    new_file_path =
      file_path
      |> String.replace("/convert/content/", "/converted/assets/static/")
      |> String.replace("/convert/static/", "/converted/assets/static/")

    [file_path, new_file_path]
  end
end
