FROM sfbaylaser/icarusalg:latest
LABEL Maintainer: Tracy Usher

# Add user so that container does not run as root 
RUN useradd -m docker 
RUN echo "docker:test" | chpasswd 
RUN usermod -s /bin/bash docker 
RUN usermod -aG wheel docker 
ENV HOME /home/docker

# Download and build TITUS
RUN cd / && \
  source larsoft/products/setup && \
  setup mrb && \
  export MRB_PROJECT=icarusalg && \
  source icarusalg/localProducts_*/setup && \
  setup icarusalg v09_18_00 -q e19:prof && \
  git clone https://github.com/TITUS-EVD/gallery-framework && \
  cd gallery-framework && \
  git checkout master && \
  source config/setup.sh && \
  make all && \
  cd UserDev/EventDisplay && \
  make 

COPY setup_titus.sh /setup_titus.sh
