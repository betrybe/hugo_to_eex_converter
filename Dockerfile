FROM elixir:1.10.3

COPY . .

CMD ["mix", "run", "-e", "HugoToEExConverter.convert"]
