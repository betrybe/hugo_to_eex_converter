defmodule HugoToEExConverter.Images do
  @source System.get_env("INPUT_STORAGEPATH")

  def copy(source \\ @source) do
    "#{source}/**/*.{png,jpeg,jpg,gif,svg}"
    |> Path.wildcard()
    |> Stream.map(&set_new_img_path/1)
    |> Enum.each(&do_copy/1)
  end

  defp do_copy([img_path, new_img_path]) do
    content = File.read!(img_path)
    dir = Path.dirname(new_img_path)

    with :ok <- File.mkdir_p(dir),
         :ok <- File.write(new_img_path, content) do
      IO.puts("Copied image: #{new_img_path}")
    else
      {:error, reason} ->
        IO.puts("Error copying file: #{new_img_path}. Reason: #{reason}")
    end
  end

  defp set_new_img_path(img_path) do
    new_img_path =
      img_path
      |> String.replace("/convert/content/", "/converted/assets/static/")
      |> String.replace("/convert/static/", "/converted/assets/static/")

    [img_path, new_img_path]
  end
end
