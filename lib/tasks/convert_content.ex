defmodule Mix.Tasks.HugoToEex.Convert do
  use Mix.Task

  @shortdoc "Convert Hugo (Go) template files to EEx (Elixir)"
  @moduledoc ~S"""
    Convert all Hugo template files in #{source}/convert to #{source}/converted as EEx (Elixir)

    #Usage
    ```
       mix hugo_to_eex.convert
    ```

    You also can pass as argument the source path where the files are

    ```
    mix hugo_to_eex.copy_images --source tmp/convert
    ```
  """
  def run([]), do: HugoToEExConverter.convert()

  def run(args) do
    case OptionParser.parse(args, strict: [source: :string]) do
      {[source: source], _, _} ->
        HugoToEExConverter.convert(source)

      {_, _, [{option, _}]} ->
        IO.puts("\nInvalid param #{option}. Did you mean --source?")
    end
  end
end
