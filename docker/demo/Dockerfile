FROM debian:bookworm-slim
COPY --from=rdkitsqlite /lib/librdkit* /lib/
RUN apt-get update -qq && apt-get install -y sqlite3
CMD ["sqlite3", ":memory:", "-cmd", ".load /lib/librdkitsqlite"]