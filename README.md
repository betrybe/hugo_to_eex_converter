# HugoToEExConverter

A Hugo (Go) to EEx (Elixir) converter

---

### Pré-requisitos

1. instale o [erlang](https://github.com/asdf-vm/asdf-erlang) 24+;
2. instale o [elixir](https://github.com/asdf-vm/asdf-elixir) 1.12+;
3. instale o [phoenix](https://hexdocs.pm/phoenix/installation.html) 1.5.9+;
4. instale o [nodejs](https://github.com/nvm-sh/nvm#installation-and-update) v14.16.0+;
5. instale o [postgres](https://www.postgresql.org/download/) 13+

### Instalação

1.  Clone o repositório

    ```sh
    git clone git@github.com:betrybe/content-object-service.git && cd content-object-service
    ```

2. Pasta de conversão local

   ```sh
   mkdir tmp/convert/content/files
   mkdir tmp/convert/converted
   ```

### Convertendo Arquivos

Dentro da raiz do projeto execute:

```sh
`mix hugo_to_eex.converter --source /tmp/convert/`
```

Esse comando vai buscar todos os arquivos `*.md` dentro da pasta criada `/tmp/convert` converter os mesmos e armazenar os resultados dentro da pasta `/tmp/converted`

### Copiando Imagens


Dentro da raiz do projeto execute:

```sh
`mix hugo_to_eex.copy_images --source /tmp/convert/`
```

Esse comando vai buscar todas as imagens dentro da pasta criada `/tmp/convert` e copiar as mesmas para a pasta `/tmp/converted`

## Usando como uma Github Action

```yaml
steps:
  - name: Convert Hugo templates to EEx
    uses: betrybe/hugo_to_eex_converter@master
    with:
      storagePath: ${{ github.workspace }}/tmp/convert
```
