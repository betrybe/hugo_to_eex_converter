defmodule Mix.Tasks.HugoToEex.CopyAssets do
  use Mix.Task

  @shortdoc "Copy assets from course"
  @moduledoc ~S"""
    Copy assets from a folder #{source}/convert to #{source}/converted
    keeping the relative path

    # Usage
    ```
    mix hugo_to_eex.copy_assets
    ```

    You  can also pass as argument the source path where the files are

    ```
    mix hugo_to_eex.copy_assets --source tmp/convert
    ```
  """
  def run([]), do: HugoToEExConverter.Assets.copy()

  def run(args) do
    case OptionParser.parse(args, strict: [source: :string]) do
      {[source: source], _, _} ->
        HugoToEExConverter.Assets.copy(source)

      {_, _, [{option, _}]} ->
        IO.puts("\nInvalid param #{option}. Did you mean --source?")
    end
  end
end
