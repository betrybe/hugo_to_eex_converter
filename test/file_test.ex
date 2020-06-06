defmodule HugoToEExConverter.FileTest do
  use ExUnit.Case, async: true

  @file_path "test/support/converted/content/react/content"

  describe "write/3" do
    test "creates an yaml file and append a flag into its content" do
      HugoToEExConverter.File.write(yaml_file_content, @file_path, ".yaml")

      assert File.exists?("#{@file_path}.yaml")
    end

    test "creates an html.md file" do
      HugoToEExConverter.File.write(yaml_file_content, @file_path, ".html.md")

      assert File.exists?("#{@file_path}.html.md")
    end
  end

  defp yaml_file_content do
    """
    ---
    title: "CSS Flexbox - Parte 1"
    date: 2019-09-25
    weight: 35
    week: 6
    day: 3
    ---
    """
  end

  defp file_content do
    """
    <%= figure(%{src: "//module/images/css_flexbox_axes.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Axes", width: "600px", height: "auto", alt: "CSS Flexbox axes description"}) %>

    [Turma 3 - Início jan/2020](/content/module/subject/sd-cohort-3)

    [Turma 5 - Início jan/2020](#sd-cohort-5)
    """
  end
end
