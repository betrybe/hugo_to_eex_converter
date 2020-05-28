defmodule Mix.Tasks.HugoToEex.CopyImages do
  use Mix.Task

  @shortdoc "Copy images from course content"
  @moduledoc ~S"""
    Copy content images keeping the original path inside of assets/static/course
    folder

    # Usage
    ```
    mix hugo_to_eex.copy_images
    ```
  """
  def run(_args) do
    HugoToEExConverter.Images.copy()
  end
end
