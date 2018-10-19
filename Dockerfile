FROM jupyter/datascience-notebook

MAINTAINER Karl Benedict <kbene@unm.edu>

USER root

# Pandoc & Latex Environment
RUN wget https://github.com/jgm/pandoc/releases/download/1.19.1/pandoc-1.19.1-1-amd64.deb
RUN dpkg -i pandoc-1.19.1-1-amd64.deb
RUN apt-get update && \
	apt-get purge texlive && \
	apt-get install -y --no-install-recommends \
	texlive \
	texlive-fonts-recommended \
	texlive-fonts-extra \
	cm-super
	
RUN mkdir /home/root
COPY startup.sh /home/root/startup.sh
RUN chmod ugo+x /home/root/startup.sh

WORKDIR /home/jovyan
RUN rm -rf /home/jovyan/work

USER jovyan

