FROM alpine:latest

ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

COPY texlive-profile.txt /tmp/

RUN apk --no-cache add \
                    make \
                    xz \
                    wget \
                    perl \
                    tar \
                    fontconfig-dev
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
     mkdir /tmp/install-tl && \
     tar -xzf install-tl-unx.tar.gz -C /tmp/install-tl --strip-components=1
RUN /tmp/install-tl/install-tl --profile=/tmp/texlive-profile.txt
RUN tlmgr install \
               graphics \
               flowfram \
               url \
               xcolor \
               pgf \
               roboto \
               fontawesome5 \
               tcolorbox

ENTRYPOINT [ "/bin/sh" ]
