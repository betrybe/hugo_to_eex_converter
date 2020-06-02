# HugoToEExConverter

A Hugo (Go) to EEx (Elixir) converter

---

### Converting files

`mix hugo_to_eex.converter` will get `*.md` files inside `~/tmp` folder by default, convert
them and store inside `~/tmp/converted`

### Copying images

`mix hugo_to_eex.copy_images` will get all images inside `~/tmp` folder by default and store
inside `~/tmp/converted`

## Use as an github action

```yaml
steps:
  - name: Convert Hugo templates to EEx
    uses: betrybe/hugo_to_eex_converter@master
    with:
      storagePath: ${{ github.workspace }}/tmp
```
