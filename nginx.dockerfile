FROM openresty/openresty:1.19.9.1-alpine



RUN apk add --no-cache --update openssl-dev pcre-dev perl-dev



RUN opm get bungle/lua-resty-session



COPY nginx.conf .

COPY nginx.vh.default.conf .

