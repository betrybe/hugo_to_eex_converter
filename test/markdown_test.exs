defmodule HugoToEExConverter.MarkdownTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Markdown

  describe "replace_tag_id_definition/1" do
    test "replace definition of tag id" do
      content =
        "### Você será capaz de: {#capabilities}"
        |> Markdown.replace_tag_id_definition()

      assert content ==
               """
               ### Você será capaz de:
               {: id="capabilities" }\
               """
    end
  end

  describe "replace_italic_underscore_syntax_to_asterisc/1" do
    test "replace italic underscore sintax to asterisc" do
      content =
        "Confira o _número_ de documentos retornados pelo _pipeline_."
        |> Markdown.replace_italic_underscore_syntax_to_asterisc()

      assert content == "Confira o *número* de documentos retornados pelo *pipeline*."
    end
  end

  describe "escape_forward_slashs_after_http_as_param/1" do
    test "escape backslashs in url params" do
      content =
        ~S|<%= figure(%{src: "https://media.giphy.com/media/giphy.gif"}) %>|
        |> Markdown.escape_forward_slashs_after_http_as_param()

      assert content == ~S|<%= figure(%{src: "https:\/\/media.giphy.com/media/giphy.gif"}) %>|
    end
  end

  describe "escape_eex_tags_between_backticks/1" do
    test "escape eex-like tags between backticks" do
      content =
        ~S|...com a diferença que agora existem as tags `<%`, `<%=` e `%>`.|
        |> Markdown.escape_eex_tags_between_backticks()

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
        |> Markdown.escape_eex_tags_between_backticks()

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
  end
end
