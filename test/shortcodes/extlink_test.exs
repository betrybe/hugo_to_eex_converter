defmodule HugoToEExConverter.Shortcodes.ExtlinkTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  describe "convert/1" do
    test "converts path to be relative to `course` content folder" do
      param1 = ~S|text: "bcrypt", href: "https://www.npmjs.com/package/bcrypt",|
      param2 = ~S|href: "https://www.npmjs.com/package/bcrypt", text: "bcrypt",|

      assert Shortcodes.Extlink.convert(param1) == expected_content()
      assert Shortcodes.Extlink.convert(param2) == expected_content()
    end
  end

  defp expected_content do
    ~S|[bcrypt](https://www.npmjs.com/package/bcrypt) {: .external-link target="_blank" rel="noreferrer noopener" }|
  end
end
