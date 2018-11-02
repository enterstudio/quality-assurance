# Quality Assurance (QA) dashboard for Open Travel Data (OPTD)
# Reference:
# * https://hub.docker.com/r/opentraveldata/quality-assurance/
# * https://github.com/opentraveldata/quality-assurance
#
FROM centos:centos7
MAINTAINER Denis Arnaud <denis.arnaud_github at m4x dot org>
LABEL version="0.1"

# Docker build time environment variables
ENV HOME /root
ENV OPTDQA_DIR ${HOME}/dev/geo/opentraveldata-qa

# Set up of the user environment
ADD resources/bashrc $HOME/.bashrc

# Import the Centos-7 GPG key to prevent warnings
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

# Update of CentOS
RUN yum -y clean all && \
    yum -y upgrade && \
    yum -y install epel-release

# Supplementary software packages
RUN yum -y install git-all bzip2 gzip tar wget curl which \
                   python34 python34-pip python34-devel \
                   python2-django mod_wsgi
RUN pip3 install -U pip pipenv
RUN pip3 install -U networkx

# Clone the Open Travel Data (OPTD) Quality Assurance (QA) Git repository
RUN mkdir -p ${HOME}/dev/geo && cd ${HOME}/dev/geo && \
    git clone https://github.com/opentraveldata/quality-assurance.git opentraveldata-qa
WORKDIR ${OPTDQA_DIR}
RUN ./mkLocalDir.sh

# Install supplementary Python packages
RUN pipenv install numpy networkx 

# Tell Docker that about the Web application
#EXPOSE 8888

# Launch Django
CMD ["bash"]


