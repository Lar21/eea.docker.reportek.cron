FROM python:3.6
MAINTAINER "Pedro Pimenta" <pedro@pontotel.com.br>

ENV CRONUSR_HOME /opt/cronusr

RUN pip install chaperone

RUN mkdir -p $CRONUSR_HOME/var
RUN groupadd -r cronusr
RUN useradd -r -g cronusr -d $CRONUSR_HOME cronusr
RUN mkdir -p /etc/chaperone.d

COPY src/chaperone.conf /etc/chaperone.d/chaperone.conf
USER cronusr

ENTRYPOINT ["/usr/local/bin/chaperone"]
