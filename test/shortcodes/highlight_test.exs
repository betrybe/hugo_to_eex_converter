defmodule HugoToEExConverter.Shortcodes.HighlightTest do
  use ExUnit.Case, async: true

  alias HugoToEExConverter.Shortcodes

  describe "convert/1" do
    test "converts to a specific language highlight" do
      content = """
      Para entendermos melhor, vamos utilizar o seguinte código como exemplo:

      {{< highlight javascript >}}
      const multiply = (a, b) => a * b;
      {{< /highlight >}}

      Primeiro vamos entender o que o código acima faz, linha a linha:
      """

      content = Shortcodes.Highlight.convert(content)

      assert content ==
               ~s"""
               Para entendermos melhor, vamos utilizar o seguinte código como exemplo:

               ```language-javascript
               const multiply = (a, b) => a * b;
               ```

               Primeiro vamos entender o que o código acima faz, linha a linha:
               """
    end

    test "converts to a specific language highlight with line numbers" do
      content = """
      {{< highlight javascript "linenos=inline" >}}
      const expires = moment().add(1, 'minutes').valueOf();
      {{< /highlight >}}
      """

      content = Shortcodes.Highlight.convert(content)

      assert content ==
               ~s"""
               \n\n```language-javascript
               const expires = moment().add(1, 'minutes').valueOf();
               ```
               {: .line-numbers}
               """
    end

    test "converts to a non-specific language highlight" do
      content = """
      {{< highlight >}}
      O nome do curso é: Curso de desenvolvimento Front-end 2019/09 - BH
      {{< /highlight >}}
      """

      content = Shortcodes.Highlight.convert(content)

      assert content ==
               """
               \n\n```
               O nome do curso é: Curso de desenvolvimento Front-end 2019/09 - BH
               ```\n
               """
    end

    test "converts to a non-specific language highlight with line numbers" do
      content = """
      {{< highlight "linenos=inline" >}}
      O nome do curso é: Curso de desenvolvimento Front-end 2019/09 - BH
      {{< /highlight >}}
      """

      content = Shortcodes.Highlight.convert(content)

      assert content ==
               """
               \n\n```
               O nome do curso é: Curso de desenvolvimento Front-end 2019/09 - BH
               ```
               {: .line-numbers}
               """
    end

    test "handles shortcodes with or without white spaces on open/close parts" do
      content = """
      Para entendermos melhor, vamos utilizar o seguinte código como exemplo:

      {{<highlight "linenos=inline">}}
      O nome do curso é: Curso de desenvolvimento Front-end 2019/09 - BH
      {{</highlight >}}
      """

      content = Shortcodes.Highlight.convert(content)

      assert content ==
               """
               Para entendermos melhor, vamos utilizar o seguinte código como exemplo:

               ```
               O nome do curso é: Curso de desenvolvimento Front-end 2019/09 - BH
               ```
               {: .line-numbers}
               """
    end
  end
end
