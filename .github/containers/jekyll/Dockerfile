FROM alpine:3.12
# Note: alpine does not have bash.
#       This will cause problems if a launching script 
#       expects to have bash available...
# Also: getopts is in util-linux-doc
RUN apk upgrade --update \
    && apk add \ 
        bash \
        util-linux \
        # coreutils \ 
        # binutils \ 
        # findutils \
        # grep \
        libatomic \
        readline \
        readline-dev \
        libxml2 \
        libxml2-dev \
        ncurses-terminfo-base \
        ncurses-terminfo \
        libxslt \
        libxslt-dev \
        zlib-dev \
        zlib \
        ruby \
        ruby-dev \
        yaml \
        yaml-dev \
        libffi-dev \
        build-base \
        git \
        nodejs \
        ruby-io-console \
        ruby-irb \
        ruby-json \
        ruby-rake \
        ruby-bundler \
        ruby-bigdecimal \ 
        ruby-webrick \
    # && gem install --no-document redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb \
    # && gem install --no-document safe_yaml \        
    # && gem install --no-document jekyll -v 4.2.0 \
    && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/*

COPY entry.bash /scripts/entry.bash
RUN chmod +x /scripts/entry.bash

EXPOSE 4000

ENTRYPOINT [ "/scripts/entry.bash" ]