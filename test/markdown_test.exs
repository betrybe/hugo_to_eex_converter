defmodule HugoToEexConverter.MarkdownTest do
  use ExUnit.Case, async: true

  alias HugoToEexConverter.Markdown

  describe "replace_italic_underscore_syntax_to_asterisc/1" do
    test "replace italic underscore sintax to asterisc" do
      content =
        "Confira o _número_ de documentos retornados pelo _pipeline_."
        |> Markdown.replace_italic_underscore_syntax_to_asterisc()

      assert content == "Confira o *número* de documentos retornados pelo *pipeline*."
    end
  end

  describe "escape_forward_slashs_after_http_as_param/1" do
    test "escape backslashs in url params" do
      content =
        ~S|<%= figure(%{src: "https://media.giphy.com/media/giphy.gif"}) %>|
        |> Markdown.escape_forward_slashs_after_http_as_param()

      assert content == ~S|<%= figure(%{src: "https:\/\/media.giphy.com/media/giphy.gif"}) %>|
    end
  end
end
