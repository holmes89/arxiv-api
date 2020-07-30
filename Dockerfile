FROM nimlang/nim:alpine AS base

WORKDIR /api
ADD . /api
RUN nimble install -y  && nim c -d:release --passL:-static -o:NimPapersFeedAPI src/NimPapersFeedAPI.nim
CMD ["./NimPapersFeedAPI"]

FROM scratch as prod

WORKDIR /
ENV PORT 8080
EXPOSE 8080
COPY --from=base /api/NimPapersFeedAPI /
CMD ["/NimPapersFeedAPI"]
