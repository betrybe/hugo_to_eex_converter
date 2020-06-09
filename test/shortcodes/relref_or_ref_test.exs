defmodule HugoToEExConverter.Shortcodes.RelrefOrRefTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  @file_path "test/support/converted/priv/markdown_templates/content/intro/unix/_index.html.md"

  describe "handle_path/2" do
    test "keeps path when it starts with /" do
      assert Shortcodes.RelrefOrRef.handle_path("\"/front-end\"", @file_path) == "/front-end"
    end

    test "keeps path when it starts with an anchor (#) linking to the same page" do
      assert Shortcodes.RelrefOrRef.handle_path("\"#sd-cohort-1\"", @file_path) == "#sd-cohort-1"
    end

    test "converts to a path relative to the current file folder" do
      assert Shortcodes.RelrefOrRef.handle_path("\"unix-part-1\"", @file_path) ==
               "/intro/unix/unix-part-1"
    end
  end
end
