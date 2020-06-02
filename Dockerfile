FROM elixir:1.10.3

COPY . .

ENTRYPOINT ["/entrypoint.sh"]
