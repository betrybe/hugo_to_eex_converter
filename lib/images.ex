defmodule HugoToEExConverter.Images do
  def copy(glob \\ "tmp/convert/content/**/*.{png,jpeg,jpg,gif,svg}") do
    glob
    |> Path.wildcard()
    |> Enum.map(&set_new_img_path/1)
    |> Enum.each(&do_copy/1)
  end

  defp do_copy([img_path, new_img_path]) do
    content = File.read!(img_path)
    dir = Path.dirname(new_img_path)

    with :ok <- File.mkdir_p(dir) do
      File.write!(new_img_path, content)
    end
  end

  defp set_new_img_path(img_path) do
    [img_path, String.replace(img_path, "/convert/content/", "/converted/course/")]
  end
end
