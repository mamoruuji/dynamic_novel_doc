FROM golang:1.23-alpine AS builder

WORKDIR /go/src/github.com/mamoruuji/dynamic_novel_api

COPY api/go.mod ./
COPY api/go.sum ./

RUN go mod download

# VScodeの拡張機能の警告対策
RUN go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest \
    && go install github.com/fatih/gomodifytags@latest \
    && go install github.com/haya14busa/goplay/cmd/goplay@latest \
    && go install -v golang.org/x/tools/gopls@latest \
    && go install github.com/cweill/gotests/...@latest \
    && go install github.com/josharian/impl@latest

# DB操作用ORMライブラリ
RUN go install github.com/volatiletech/sqlboiler/v4@latest \
    && go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-psql@latest
# RUN go get -v github.com/volatiletech/null/v8

# connect-go
RUN go install github.com/bufbuild/buf/cmd/buf@latest \
    && go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest \
    && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    && go install github.com/bufbuild/connect-go/cmd/protoc-gen-connect-go@latest

# テストツール （gomockは不要になる予定）
# RUN go install github.com/golang/mock/mockgen@v1.7.0-rc.1 \
#     && go install github.com/stretchr/testify/mock@v1.9.0 \
#     && go install github.com/DATA-DOG/go-sqlmock


FROM golang:1.23-alpine

# 必要なツールのインストール
RUN apk add --no-cache \
    tzdata \
    curl \
    git

ENV TZ=Asia/Tokyo

COPY --from=builder /go/bin /go/bin

ENV PATH="/go/bin:${PATH}"

WORKDIR /go/src/github.com/mamoruuji/dynamic_novel_api
