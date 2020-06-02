FROM elixir:1.10.3

RUN mkdir /app

COPY . /app

ENTRYPOINT ["/app/entrypoint.sh"]
