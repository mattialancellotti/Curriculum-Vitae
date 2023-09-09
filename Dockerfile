FROM alpine:latest

ENV PATH=/usr/share/texlive/bin/x86_64-linuxmusl:$PATH

COPY texlive-profile.txt proj/
COPY src/* proj/
RUN mkdir ~/texmf

RUN apk update && apk add texmf-dist texlive
RUN apk --no-cache add \
                    make \
                    xz \
                    wget \
                    perl \
                    tar \
                    fontconfig-dev
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
     mkdir proj/install-tl && \
     tar -xzf install-tl-unx.tar.gz -C proj/install-tl --strip-components=1
RUN proj/install-tl/install-tl --profile=proj/texlive-profile.txt
RUN tlmgr install \
               collection-basic \
               collection-latex \
               collection-latexrecommended \
               collection-latexextra \
               collection-fontsrecommended \
               graphics \
               flowfram \
               url \
               xcolor \
               pgf \
               roboto \
               fontawesome5 \
               tcolorbox

WORKDIR proj/

ENTRYPOINT [ "/bin/sh" ]
