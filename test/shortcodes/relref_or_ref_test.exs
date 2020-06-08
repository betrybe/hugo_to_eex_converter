defmodule HugoToEExConverter.Shortcodes.RelrefOrRefTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  describe "handle_path/2" do
    test "keeps path when it starts with /" do
      assert Shortcodes.RelrefOrRef.handle_path("\"/front-end\"") == "/front-end"
    end

    test "keeps path when it starts with an anchor (#) linking to the same page" do
      assert Shortcodes.RelrefOrRef.handle_path("\"#sd-cohort-1\"") == "#sd-cohort-1"
    end

    test "converts to a path relative to the current file folder" do
      assert Shortcodes.RelrefOrRef.handle_path("\"introduction\"") ==
               "introduction"
    end
  end
end
