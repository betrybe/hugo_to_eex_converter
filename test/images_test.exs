defmodule HugoToEExConverter.ImagesTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Images

  @img_path "test/support/converted/course/module/subject/trybe.svg"

  setup do
    on_exit(fn -> File.rm!(@img_path) end)
  end

  describe "copy/1" do
    test "copies images from a folder to another" do
      Images.copy("test/support/convert")

      assert File.exists?(@img_path)
    end
  end
end
