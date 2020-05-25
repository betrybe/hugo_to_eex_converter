defmodule HugoToEexConverter.Shortcodes.FigureTest do
  use ExUnit.Case, async: true

  alias HugoToEexConverter.Shortcodes

  @file_path "../trybe/priv/markdown_templates/content/course/front-end/react/_index.md"

  describe "convert/2" do
    test "converts to a figure eex tag and set image to relative to `/course` folder path" do
      params =
        ~S|src="images/main_screen.png" caption="Tela principal do Slack" class="standard-screenshot"|

      assert Shortcodes.Figure.convert(params, @file_path) == expected_content(:one)
    end

    test "converts to a figure eex tag and set image path to parent folder" do
      params =
        ~S|src="../images/pr-description.png" caption="Cabeçalho do Pull Request (PR)" class="cr-screen"|

      assert Shortcodes.Figure.convert(params, @file_path) == expected_content(:two)
    end
  end

  defp expected_content(:one) do
    ~S|<%= figure(%{src: "/course/front-end/react/images/main_screen.png", caption: "Tela principal do Slack", class: "standard-screenshot",}) %>|
  end

  defp expected_content(:two) do
    ~S|<%= figure(%{src: "/course/front-end/images/pr-description.png", caption: "Cabeçalho do Pull Request (PR)", class: "cr-screen",}) %>|
  end
end