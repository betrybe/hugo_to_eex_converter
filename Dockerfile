FROM elixir:1.10.3

COPY . .

CMD ["HugoToEExConverter.convert()"]
CMD ["HugoToEExConverter.Images.copy()"]
