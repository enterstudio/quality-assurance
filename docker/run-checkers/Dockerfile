# Quality Assurance (QA) dashboard for Open Travel Data (OPTD)
# Reference:
# * https://hub.docker.com/r/opentraveldata/quality-assurance/
# * https://github.com/opentraveldata/quality-assurance/tree/master/docker
#
FROM opentraveldata/quality-assurance:base
MAINTAINER Denis Arnaud <denis.arnaud_github at m4x dot org>
LABEL version="0.1"

# Docker build time environment variables
ENV HOME /root
ENV OPTDQA_DIR ${HOME}/dev/geo/opentraveldata-qa
ENV LANG en_US.UTF-8
ENV LC_ALL ${LANG}

# Run a few checkers
WORKDIR ${OPTDQA_DIR}
RUN pipenv run checkers/check-por-cmp-optd-unlc.py > results/optd-qa-por-optd-vs-unlc.json 

# Launch a Bash Shell
CMD ["bash"]


