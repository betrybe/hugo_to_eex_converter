FROM elixir:1.10.3

COPY . .

CMD ["mix", "compile"]
CMD ["mix", "hugo_to_eex.convert"]
CMD ["mix", "hugo_to_eex.copy_images"]
