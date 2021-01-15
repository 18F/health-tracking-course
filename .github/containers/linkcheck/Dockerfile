FROM racket/racket:7.9-cs-full
WORKDIR /

RUN raco pkg install \
    --no-docs --auto \
    chk \
    html-parsing \
    http-easy

RUN git clone https://github.com/jadudm/linkcheck 
WORKDIR /linkcheck
RUN raco exe -o app/linkcheck app/cmdline.rkt

# Leaves us with /linkcheck/app/linkcheck as a path.
ENTRYPOINT [ "/linkcheck/app/linkcheck" ]