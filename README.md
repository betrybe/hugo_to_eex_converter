# HugoToEExConverter

A Hugo (Go) to EEx (Elixir) converter

---

### Converting files

In the repo root path, run:

`$ mix hugo_to_eex.converter`

This command will get `*.md` files inside `~/tmp/convert` folder by default, convert
them and store inside `~/tmp/converted`

### Copying images

In the repo root path, run:

`$ mix hugo_to_eex.copy_images`

This command will get all images inside `~/tmp/convert` folder by default and store
inside `~/tmp/converted`

## Using as github action

```yaml
steps:
  - name: Convert Hugo templates to EEx
    uses: betrybe/hugo_to_eex_converter@master
    with:
      storagePath: ${{ github.workspace }}/tmp/convert
```
