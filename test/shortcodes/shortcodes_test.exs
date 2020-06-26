defmodule HugoToEExConverter.ShortcodesTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  @file_path "test/support/converted/content/module/subject/content.md"

  describe "convert/2" do
    test "converts all shortcodes to elixir functions" do
      assert Shortcodes.convert(file_content(), @file_path) == expected_content()
    end
  end

  def file_content do
    """
    {{< figure src="https://media.giphy.com/media/MTdHOLBVYpVOLY4gRN/giphy.gif" caption="O que o banco pensa quando você diz `JOIN`" class="text-center rounded mx-auto d-block" width="588px" height="auto">}}

    {{< figure src="../images/css_flexbox_axes.png" class="rounded mx-auto d-block" caption="CSS Flexbox Axes" width="600px" height="auto" alt="CSS Flexbox axes description" >}}

    {{< figure src="images/css_flexbox_single_line.png" class="rounded mx-auto d-block" caption="CSS Flexbox Single Line" width="600px" height="auto" >}}

    {{< highlight css >}}
    .flex-container {
      display: flex;
    }
    {{< / highlight >}}

    {{< highlight javascript "linenos=inline" >}}
    let car = "Fiat";
    {{< / highlight >}}

    {{< highlight "linenos=inline" >}}
    Trybe
    {{< / highlight >}}

    [Turma 3 - Início jan/2020]({{< relref "sd-cohort-3" >}})

    [Turma 5 - Início jan/2020]({{< relref "#sd-cohort-5" >}})

    {{< yt id="22PTowIiZUA" >}}

    {{< vm id="22PTowIiZUA" >}}

    {{< ytp id="22PTowIiZUA" >}}

    {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-direction_column" >}}

    [git]({{< ref "/intro/git" >}})

    {{< versioning-your-code >}}

    {{< next-btn >}}

    {{< who-am-i name: "Norberto Oliveira Junior (Norba)", role: "Software Developer" >}}

    Mineirin de Itararé

    {{< /who-am-i >}}
    """
  end

  def expected_content do
    """
    <%= figure(%{src: "https:\/\/media.giphy.com/media/MTdHOLBVYpVOLY4gRN/giphy.gif", caption: "O que o banco pensa quando você diz `JOIN`", class: "text-center rounded mx-auto d-block", width: "588px", height: "auto"}) do %>

    <%= figure(%{src: "/module/subject/images/css_flexbox_axes.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Axes", width: "600px", height: "auto", alt: "CSS Flexbox axes description"}) %>

    <%= figure(%{src: "/module/subject/images/css_flexbox_single_line.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Single Line", width: "600px", height: "auto"}) %>

    ```language-css
    .flex-container {
      display: flex;
    }
    ```

    ```language-javascript
    let car = "Fiat";
    ```
    {: .line-numbers}

    ```
    Trybe
    ```
    {: .line-numbers}

    [Turma 3 - Início jan/2020](/module/subject/sd-cohort-3)

    [Turma 5 - Início jan/2020](#sd-cohort-5)

    <%= youtube_video "22PTowIiZUA" %>

    <%= vimeo "22PTowIiZUA" %>

    <%= youtube_playlist "22PTowIiZUA" %>

    [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-direction_column) {: .external-link target="_blank" rel="noreferrer noopener" }

    [git](/intro/git)

    <%= versioning_your_code(@conn) %>

    <%= next_button(@conn) %>

    <%= whoami(%{name: "Norberto Oliveira Junior (Norba)", role: "Software Developer"}) %>

    Mineirin de Itararé

    <% end %>
    """
  end
end
