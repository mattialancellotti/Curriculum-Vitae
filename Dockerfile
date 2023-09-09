FROM alpine:latest

ENV PATH=/usr/share/texlive/bin/x86_64-linuxmusl:$PATH
RUN mkdir ~/texmf

COPY texlive-profile.txt /temp/
COPY src/* cvtex/src/

RUN apk update
RUN apk --no-cache add \
                    texmf-dist \
                    texlive \
                    make \
                    xz \
                    wget \
                    perl \
                    tar \
                    fontconfig-dev
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
     mkdir /temp/install-tl && \
     tar -xzf install-tl-unx.tar.gz -C /temp/install-tl --strip-components=1
RUN /temp/install-tl/install-tl --profile=/temp/texlive-profile.txt
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

WORKDIR cvtex/src/
RUN make

FROM scratch
COPY --from=0 cvtex/src/cv.pdf .

ENTRYPOINT [ "/bin/sh" ]
