defmodule HugoToEExConverter.Utils.FileTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Utils

  @file_path "test/support/converted/content/css-flex-box/content"

  @yaml_content
  """
  ---
  title: "CSS Flexbox - Parte 1"
  date: 2019-09-25
  weight: 35
  week: 6
  day: 3
  ---
  """

  @file_content
  """
  <%= figure(%{src: "/module/images/css_flexbox_axes.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Axes", width: "600px", height: "auto", alt: "CSS Flexbox axes description"}) %>

  [Turma 3 - Início jan/2020](/content/module/subject/sd-cohort-3)

  [Turma 5 - Início jan/2020](#sd-cohort-5)
  """

  setup do
    on_exit(fn ->
      File.rm!("#{@file_path}.yaml")
      File.rm!("#{@file_path}.html.md")
      File.rm_dir!("test/support/converted")
    end)
  end

  describe "create_converted_folder!/1" do
    test "creates the folder /converted" do
      Utils.File.create_converted_folder!("test/support/convert")

      assert File.exists?("test/support/converted")
    end
  end

  describe "write/3" do
    test "creates an yaml file and append a flag into its content" do
      Utils.File.write(yaml_file_content, @file_path, ".yaml")

      assert File.read!("#{@file_path}.yaml") == expected_yaml_file_content()
    end

    test "creates an html.md file" do
      Utils.File.write(yaml_file_content, @file_path, ".html.md")

      assert File.read!("#{@file_path}.html.md") == @file_content
    end
  end

  defp expected_yaml_file_content do
    """
    ---
    title: "CSS Flexbox - Parte 1"
    date: 2019-09-25
    weight: 35
    week: 6
    day: 3
    course: true
    ---
    """
  end
end
