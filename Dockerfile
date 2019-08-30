FROM elixir:1.9

LABEL maintainer="Alessander Viana <alessander.viana@hotmail.com>"

WORKDIR /app
COPY . .

# Elixir expects utf8, sets ENV to PROD
ENV LANG=C.UTF-8 \
        MIX_ENV=test

# Install Elixir, install Phoenix and changes the app to PROD mode
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install --force hex phx_new 1.4.3 \
    && mix deps.get \
    && mix deps.compile

EXPOSE 4000

# CMD ["mix", "phx.server"]
