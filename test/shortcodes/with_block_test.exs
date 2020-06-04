defmodule HugoToEExConverter.Shortcodes.WithBlockTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  describe "convert/1" do
    test "converts block shortcodes to eex do..end" do
      file_content = """
      {{< who-am-i name: "Norberto Oliveira Junior (Norba)", role: "Software Developer" >}}

      Mineirin de Itararé

      {{< /who-am-i >}}
      """

      assert Shortcodes.WithBlock.convert(file_content) ==
               """
               <%= whoami(%{name: "Norberto Oliveira Junior (Norba)", role: "Software Developer" }) do %>

               Mineirin de Itararé

               <% end %>
               """
    end
  end
end
