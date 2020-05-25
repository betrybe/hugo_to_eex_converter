defmodule HugoToEExConverter.Shortcodes.RelrefOrRefTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  @file_path "tmp/content/course/front-end/react/_index.md"

  describe "handle_path/2" do
    test "converts to a path relative to the current file folder" do
      assert Shortcodes.RelrefOrRef.handle_path("introduction", @file_path) ==
               "/course/front-end/react/introduction"
    end

    test "converts to a path relative to `/course` content folder" do
      assert Shortcodes.RelrefOrRef.handle_path("/front-end", @file_path) == "/course/front-end"
    end

    test "converts to an anchor linking to the same page" do
      assert Shortcodes.RelrefOrRef.handle_path("#sd-cohort-1", @file_path) == "#sd-cohort-1"
    end
  end
end
