FROM debian:bookworm-slim
COPY --from=ghcr.io/uoy-research/rdkit-sqlite:main /lib/librdkit* /lib/
RUN apt-get update -qq && apt-get install -y sqlite3
CMD ["sqlite3", ":memory:", "-cmd", ".load /lib/librdkitsqlite"]