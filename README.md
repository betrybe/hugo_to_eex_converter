# HugoToEExConverter

A Hugo (Go) to EEx (Elixir) converter

---

### Converting files

`mix hugo_to_eex.converter` will get `*.md` files inside `~/tmp` folder, convert
them and store inside `~/tmp/converted`

### Copying images

`mix hugo_to_eex.copy_images` will get all images inside `~/tmp` folder and store
inside `~/tmp/converted`

## Using it as an github action

```yaml
steps:
  - name: Convert Hugo templates to EEx
    uses: betrybe/hugo_to_eex_converter@hugo-to-eex-converter
    with:
      storagePath: ${{ github.workspace/tmp }}
```
