defmodule HugoToEExConverter.Utils.PathTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Utils

  describe "relative_to/2" do
    test "resolves path relative to file current folder" do
      path = Utils.Path.relative_to("react.png", "content/front-end/react/_index.html.md")

      assert path == "/front-end/react/react.png"
    end

    test "resolves path relative to file current folder expanding the `..` characters" do
      path =
        Utils.Path.relative_to("../images/react.png", "content/front-end/react/_index.html.md")

      assert path == "/front-end/images/react.png"
    end
  end
end
