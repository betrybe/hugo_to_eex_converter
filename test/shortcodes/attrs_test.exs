defmodule HugoToEexConverter.Shortcodes.AttrsTest do
  use ExUnit.Case, async: true

  alias HugoToEexConverter.Shortcodes

  describe "convert/1" do
    test "converts shortcode attrs syntax" do
      file_content = """
      .* {{< extlink text="Os 12 princípios do Manifesto Ágil" href="https://y2u.be/e4VYnCRU25E" >}}

      {{< yt id="7JRB33f_M3k" >}}

      {{< figure src="images/client-server.png" class="text-center rounded mx-auto d-block" width="788px" height="auto" caption="Arquitetura cliente-servidor" >}}
      """

      assert Shortcodes.Attrs.convert(file_content) ==
               """
               .* {{< extlink text: "Os 12 princípios do Manifesto Ágil", href: "https://y2u.be/e4VYnCRU25E", >}}

               {{< yt id: "7JRB33f_M3k", >}}

               {{< figure src: "images/client-server.png", class: "text-center rounded mx-auto d-block", width: "788px", height: "auto", caption: "Arquitetura cliente-servidor", >}}
               """
    end
  end
end
