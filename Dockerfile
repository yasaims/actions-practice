# -- build stage --

FROM ubuntu:24.04 AS build
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ cmake make git ca-certificates
WORKDIR /src
COPY . .
RUN cmake -B build && cmake --build build

# -- runtime stage --
FROM ubuntu:24.04
COPY --from=build /src/build/main /usr/local/bin/main
ENTRYPOINT ["main"]