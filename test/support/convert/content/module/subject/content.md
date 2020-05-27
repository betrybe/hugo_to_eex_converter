---
title: "CSS Flexbox - Parte 1"
date: 2019-09-25
weight: 35
week: 6
day: 3
---

{{< figure src="https://media.giphy.com/media/MTdHOLBVYpVOLY4gRN/giphy.gif" caption="O que o banco pensa quando você diz `JOIN`" class="text-center rounded mx-auto d-block" width="588px" height="auto">}}

Recapitulando o que aprendemos no módulo sobre [git]({{< ref "/intro/git" >}}), ao versionar nossos projetos, nós os associamos a repositórios remotos (_remotes_). Por padrão, adicionamos um _remote_ chamado **origem**.

Um Flex container é criado ao usar a propriedade `display` de um elemento com o valor `flex`:

{{< highlight css >}}
.flex-container {
  display: flex;
}
{{< / highlight >}}

---

{{< figure src="../images/css_flexbox_axes.png" class="rounded mx-auto d-block" caption="CSS Flexbox Axes" width="600px" height="auto" alt="CSS Flexbox axes description" >}}

[Turma 3 - Início jan/2020]({{< relref "sd-cohort-3" >}})

[Turma 5 - Início jan/2020]({{< relref "#sd-cohort-5" >}})

#### Flex Lines

{{< figure src="images/css_flexbox_single_line.png" class="rounded mx-auto d-block" caption="CSS Flexbox Single Line" width="600px" height="auto" >}}

{{< figure src="/module/images/css_flexbox_multi_line.png" class="rounded mx-auto d-block" caption="CSS Flexbox Multi Line" width="600px" height="auto" >}}

Agora vamos ver a estrutura e propriedades do Flexbox.

### Introdução e estrutura básica

{{< yt id="22PTowIiZUA" >}}

### Propriedades: flex-direction, flex-wrap, flex-flow e reverse

{{< yt id="ILHpH39QiG0" >}}

* Teste as possibilidades (`row`, `column`, `row-reverse` e `column-reverse`) para a propriedade `flex-direction` {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-direction_column" >}}

* Teste as possibilidades (`wrap` e `nowrap`) para a propriedade `flex-wrap` {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-wrap_wrap" >}}

* Teste as possibilidades para a propriedade `flex-flow` {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_flex-flow_row_wrap" >}}

### Propriedades: justify-content

{{< yt id="V562GPPegJ4" >}}

* Teste as possibilidades (`center`, `flex-start`, `flex-end`, `space-around` e `space-between`) para a propriedade `justify-content` {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_justify-content_center" >}}

### Propriedades: align-items

{{< yt id="TAuwOBN_F28" >}}

* Teste as possibilidades (`center`, `flex-start`, `flex-end`, `stretch` e `baseline`) para a propriedade `align-items` {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_align-items_baseline" >}}

### Propriedades: align-content

{{< yt id="BVZ3AeYaGh0" >}}

* Teste as possibilidades (`center`, `flex-start`, `flex-end`, `stretch`, `space-around` e `space-between`) para a propriedade `align-content` {{< extlink text="aqui" href="https://www.w3schools.com/css/tryit.asp?filename=trycss3_flexbox_align-content_space-between" >}}

---

### Agora, a prática

Para os exercícios a seguir, utilize este {{< extlink text="playground" href="https://the-echoplex.net/flexyboxes/" >}} para testar como as propriedades **Flexbox** influenciam a disposição dos elementos em um _container_. Existem outros _playgrounds_ para **Flexbox** como este, e os links para eles estão nos **Recursos adicionais**.

Como os exercícios serão feitos na própria plataforma, crie um diretório em seu repositório para o site número 1 (problema do sapo) e outra para o site número 2 (problema das torres).
Salve o ***CSS*** que você criar na plataforma colocando o número do exercício como nome do arquivo, veja exemplos abaixo:

- Para o exercício número 3 do site número 1, o ***CSS*** deve ser salvo em `exercises/6.3/1/3.css`;

- Para o exercício número 8 do site número 2, o ***CSS*** deve ser salvo em `exercises/6.3/2/8.css`;

- Para o exercício número 9 do site número 2, o ***CSS*** deve ser salvo em `exercises/6.3/2/9.css`.

1. Faça os exercícios de **1** a **13** neste {{< extlink text="site" href="https://flexboxfroggy.com/" >}}. O seu objetivo é colocar os sapos em cima de suas respectivas folhas.
2. Neste segundo {{< extlink text="link" href="http://www.flexboxdefense.com/" >}}, complete os exercícios de **1** a **9**. Seu objetivo aqui é posicionar as torres de defesa para que elas abatam os inimigos. Você terá de pensar qual é a melhor posição para cada torre.

---

## Recursos adicionais (opcional)

* {{< extlink text="W3Schools CSS Flexbox" href="https://www.w3schools.com/css/css3_flexbox.asp" >}}

* {{< extlink text="CSS Tricks: A Complete Guide To Flexbox" href="https://css-tricks.com/snippets/css/a-guide-to-flexbox/" >}}

* {{< extlink text="Playground: Properties for the flex container" href="https://codepen.io/enxaneta/full/adLPwv" >}}

* {{< extlink text="Playground: Scotch.io" href="https://demos.scotch.io/visual-guide-to-css3-flexbox-flexbox-playground/demos/" >}}

---

{{< versioning-your-code >}}

{{< next-btn >}}
