defmodule HugoToEExConverterTest do
  use ExUnit.Case, async: true

  @converted_dir "test/support/converted"
  @eex_markdown_file_path "test/support/converted/priv/markdown_templates/content/module/subject/content.html.md"
  @frontmatter_file_path "test/support/converted/priv/markdown_templates/content/module/subject/content.yaml"

  setup do
    on_exit(fn -> File.rm_rf(@converted_dir) end)
  end

  describe "convert/1" do
    test "converts hugo (go) templates files to eex (elixir)" do
      HugoToEExConverter.convert("test/support/convert")

      assert File.read!(@frontmatter_file_path) == expected_frontmatter()
      assert File.read!(@eex_markdown_file_path) == expected_eex_markdown()
    end
  end

  defp expected_frontmatter do
    """
    ---
    title: "CSS Flexbox - Parte 1"
    date: 2019-09-25
    weight: 35
    week: 6
    day: 3
    course: true
    ---\
    """
  end

  defp expected_eex_markdown do
    ~S"""
    <%= figure(%{src: "https:\/\/media.giphy.com/media/MTdHOLBVYpVOLY4gRN/giphy.gif", caption: "O que o banco pensa quando você diz \`JOIN\`", class: "text-center rounded mx-auto d-block", width: "588px", height: "auto"}) %>

    Recapitulando o que aprendemos no módulo sobre [git](/intro/git), ao versionar nossos projetos, nós os associamos a repositórios remotos (_remotes_). Por padrão, adicionamos um *remote* chamado **origem**.

    Um Flex container é criado ao usar a propriedade `display` de um elemento com o valor `flex`:

    ```language-css
    .flex-container {
      display: flex;
    }
    ```

    ---

    <%= figure(%{src: "/module/subject/images/css_flexbox_axes.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Axes", width: "600px", height: "auto", alt: "CSS Flexbox axes description"}) %>

    [Turma 3 - Início jan/2020](/module/subject/sd-cohort-3)

    [Turma 5 - Início jan/2020](#sd-cohort-5)

    #### Flex Lines

    <%= figure(%{src: "/module/subject/images/css_flexbox_single_line.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Single Line", width: "600px", height: "auto"}) %>

    <%= figure(%{src: "/module/images/css_flexbox_multi_line.png", class: "rounded mx-auto d-block", caption: "CSS Flexbox Multi Line", width: "600px", height: "auto"}) %>

    Agora vamos ver a estrutura e propriedades do Flexbox.

    ### Introdução e estrutura básica

    <%= youtube_video "22PTowIiZUA" %>

    ### Propriedades: flex-direction, flex-wrap, flex-flow e reverse

    <%= youtube_video "ILHpH39QiG0" %>

    * Teste as possibilidades (`row`, `column`, `row-reverse` e `column-reverse`) para a propriedade `flex-direction` [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-direction_column) {: .external-link target="_blank" rel="noreferrer noopener" }

    * Teste as possibilidades (`wrap` e `nowrap`) para a propriedade `flex-wrap` [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-wrap_wrap) {: .external-link target="_blank" rel="noreferrer noopener" }

    * Teste as possibilidades para a propriedade `flex-flow` [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-flow_row_wrap) {: .external-link target="_blank" rel="noreferrer noopener" }

    ### Propriedades: justify-content

    <%= youtube_video "V562GPPegJ4" %>

    * Teste as possibilidades (`center`, `flex-start`, `flex-end`, `space-around` e `space-between`) para a propriedade `justify-content` [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_justify-content_center) {: .external-link target="_blank" rel="noreferrer noopener" }

    ### Propriedades: align-items

    <%= youtube_video "TAuwOBN_F28" %>

    * Teste as possibilidades (`center`, `flex-start`, `flex-end`, `stretch` e `baseline`) para a propriedade `align-items` [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_align-items_baseline) {: .external-link target="_blank" rel="noreferrer noopener" }

    ### Propriedades: align-content

    <%= youtube_video "BVZ3AeYaGh0" %>

    * Teste as possibilidades (`center`, `flex-start`, `flex-end`, `stretch`, `space-around` e `space-between`) para a propriedade `align-content` [aqui](https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_align-content_space-between) {: .external-link target="_blank" rel="noreferrer noopener" }

    ---

    ### Agora, a prática

    Para os exercícios a seguir, utilize este [playground](https://the-echoplex.net/flexyboxes/) {: .external-link target="_blank" rel="noreferrer noopener" } para testar como as propriedades **Flexbox** influenciam a disposição dos elementos em um *container*. Existem outros *playgrounds* para **Flexbox** como este, e os links para eles estão nos **Recursos adicionais**.

    Como os exercícios serão feitos na própria plataforma, crie um diretório em seu repositório para o site número 1 (problema do sapo) e outra para o site número 2 (problema das torres).
    Salve o ***CSS*** que você criar na plataforma colocando o número do exercício como nome do arquivo, veja exemplos abaixo:

    - Para o exercício número 3 do site número 1, o ***CSS*** deve ser salvo em `exercises/6.3/1/3.css`;

    - Para o exercício número 8 do site número 2, o ***CSS*** deve ser salvo em `exercises/6.3/2/8.css`;

    - Para o exercício número 9 do site número 2, o ***CSS*** deve ser salvo em `exercises/6.3/2/9.css`.

    1. Faça os exercícios de **1** a **13** neste [site](https://flexboxfroggy.com/) {: .external-link target="_blank" rel="noreferrer noopener" }. O seu objetivo é colocar os sapos em cima de suas respectivas folhas.
    2. Neste segundo [link](http://www.flexboxdefense.com/) {: .external-link target="_blank" rel="noreferrer noopener" }, complete os exercícios de **1** a **9**. Seu objetivo aqui é posicionar as torres de defesa para que elas abatam os inimigos. Você terá de pensar qual é a melhor posição para cada torre.

    ---

    ## Recursos adicionais (opcional)

    * [W3Schools CSS Flexbox](https://www.w3schools.com/css/css3_flexbox.asp) {: .external-link target="_blank" rel="noreferrer noopener" }

    * [CSS Tricks: A Complete Guide To Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) {: .external-link target="_blank" rel="noreferrer noopener" }

    * [Playground: Properties for the flex container](https://codepen.io/enxaneta/full/adLPwv) {: .external-link target="_blank" rel="noreferrer noopener" }

    * [Playground: Scotch.io](https://demos.scotch.io/visual-guide-to-css3-flexbox-flexbox-playground/demos/) {: .external-link target="_blank" rel="noreferrer noopener" }

    ---

    <%= versioning_your_code(@conn) %>

    <%= next_button(@conn) %>
    """
  end
end
