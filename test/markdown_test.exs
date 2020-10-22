defmodule HugoToEExConverter.MarkdownTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Markdown

  describe "convert/1" do
    test "replace definition of tag id" do
      content =
        "### Você será capaz de: {#capabilities}"
        |> Markdown.convert()

      assert content ==
               """
               ### Você será capaz de:
               {: id="capabilities" }\
               """
    end

    test "escape backslashs in url params" do
      content =
        ~S|<%= figure(%{src: "https://media.giphy.com/media/giphy.gif"}) %>|
        |> Markdown.convert()

      assert content == ~S|<%= figure(%{src: "https:\/\/media.giphy.com/media/giphy.gif"}) %>|
    end

    test "escape eex-like tags between backticks" do
      content =
        ~S|...com a diferença que agora existem as tags `<%`, `<%=` e `%>`.|
        |> Markdown.convert()

      assert content == ~S|...com a diferença que agora existem as tags `<%%`, `<%%=` e `%>`.|
    end

    test "does not escape eex-like tags which aren't between backticks" do
      content =
        """
        {{< highlight html >}}
        <ul>
          <% authors.forEach((author) => { %>
            <li><%= author.name %></li>
          <% }) %>
        </ul>
        {{< /highlight >}}

        ..com a diferença que agora existem as tags `<%`, `<%=` e `%>`.
        """
        |> Markdown.convert()

      assert content ==
               """
               {{< highlight html >}}
               <ul>
                 <% authors.forEach((author) => { %>
                   <li><%= author.name %></li>
                 <% }) %>
               </ul>
               {{< /highlight >}}

               ..com a diferença que agora existem as tags `<%%`, `<%%=` e `%>`.
               """
    end

    test "does not escape python code" do
      content =
        """
        {{< highlight python >}}
        import sys


        if __name__ == "__main__":
            for argument in sys.argv:
                print("Received -> ", argument)
        {{< /highlight >}}
        """
        |> Markdown.convert()

      assert content ==
               """
               {{< highlight python >}}
               import sys


               if __name__ == "__main__":
                   for argument in sys.argv:
                       print("Received -> ", argument)
               {{< /highlight >}}
               """
    end
  end
end
