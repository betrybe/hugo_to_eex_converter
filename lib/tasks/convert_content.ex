defmodule Mix.Tasks.HugoToEex.Convert do
  use Mix.Task

  @shortdoc "Convert Hugo (Go) template files to EEx (Elixir)"
  @moduledoc ~S"""
    Convert all Hugo template files in tmp/convert to tmp/converted as EEx (Elixir)

    #Usage
    ```
       mix hugo_to_eex.convert
    ```
  """
  def run(_args) do
    HugoToEExConverter.convert()
  end
end
