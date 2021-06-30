FROM elixir:1.12.1-alpine

RUN apk add --no-cache build-base npm git python3 inotify-tools bash

WORKDIR /app

COPY assets/package.json assets/package-lock.json ./assets/
RUN npm install --prefix ./assets

RUN mix local.hex --force && \
    mix local.rebar --force
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

COPY entrypoint.sh entrypoint.sh

EXPOSE 4000