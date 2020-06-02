defmodule Mix.Tasks.HugoToEex.CopyImages do
  use Mix.Task

  @shortdoc "Copy images from course content"
  @moduledoc ~S"""
    Copy content images from a folder #{source}/convert to #{source}/converted
    keeping the relative path

    # Usage
    ```
    mix hugo_to_eex.copy_images
    ```

    You  can also pass as argument the source path where the files are

    ```
    mix hugo_to_eex.copy_images --source tmp/convert
    ```
  """
  def run([]), do: HugoToEExConverter.Images.copy()

  def run(args) do
    case OptionParser.parse(args, strict: [source: :string]) do
      {[source: source], _, _} ->
        HugoToEExConverter.Images.copy(source)

      {_, _, [{option, _}]} ->
        IO.puts("\nInvalid param #{option}. Did you mean --source?")
    end
  end
end
