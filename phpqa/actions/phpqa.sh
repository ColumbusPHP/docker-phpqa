#!/usr/bin/env bash

set -e

gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"
debMultiarch="$(dpkg-architecture --query DEB_BUILD_MULTIARCH)"

cd /usr/src/php \
  && ./buildconf \
  && CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" ./configure \
    --build="$gnuArch" \
    --with-config-file-path="$PHP_INI_DIR" \
    --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
    --enable-ftp \
    --enable-mbstring \
    --enable-mysqlnd \
    --with-curl \
    --with-libedit \
    --with-libopenssl \
    --with-zlib \
    --with-pcre-regex=/usr \
    --with-libdir="lib/$debMultiarch" \
    $PHP_EXTRA_CONFIGURE_ARGS \
  && make -j "$(nproc)" \
  && make install \
  && { find /usr/local/bin /usr/local/sbin -type f -executable -exec strip --strip-all '{}' + || true; } \
  && cd / \
  && pecl update-channels \
  && rm -rf /tmp/pear ~/.pearrc 

cd /usr/src/php/scripts/dev \
   && php -d phar.readonly=0 generate-phpt/gtPackage.php \
   && cd /

cd /usr/src/php \
  && make test TESTS="${PHPQA_TESTS}"

