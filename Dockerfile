# -- build stage --

FROM ubuntu:20.04 AS build
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ cmake make git ca-certificates
WORKDIR /src
COPY . .
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build

# -- runtime stage --
FROM ubuntu:20.04
COPY --from=build /src/build/main /usr/local/bin/main
ENTRYPOINT ["main"]