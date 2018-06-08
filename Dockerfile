FROM hepsw/cvmfs-cms
RUN mkdir -p /cvmfs/grid.cern.ch && mkdir -p /cvmfs/sft.cern.ch && \
    echo "grid.cern.ch /cvmfs/grid.cern.ch cvmfs defaults 0 0" >> /etc/fstab && \
    echo "sft.cern.ch /cvmfs/sft.cern.ch cvmfs defaults 0 0" >> /etc/fstab

RUN yum history sync \
 && yum update -y -q --exclude=cvmfs* \
 && yum install -y -q \
        glibc-devel\
        glibc-devel.i686 \
        git \
        sudo \
        wget \
 &&  rm -fr /var/cache

COPY run.sh /scripts/run.sh

ENV OUTPUT_DIR /output
VOLUME ${OUTPUT_DIR}
workdir ${OUTPUT_DIR}

ENV NUMBER_OF_CORES 2

ENV USERNAME cms
ARG USERID=1000
RUN adduser -u ${USERID} ${USERNAME} && \
  echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} && \
  chmod 0440 /etc/sudoers.d/${USERNAME}

ENV RUN_DAT /data/Run.dat_ttbar_13TeV
ENV MAKE_LIBS_SCRIPT /data/MakeSherpaLibs.sh
COPY Run.dat_ttbar_13TeV ${RUN_DAT}
COPY MakeSherpaLibs.sh ${MAKE_LIBS_SCRIPT}

USER cms
ENV HOME /home/${USERNAME}
ENV NEVTS 1

ENTRYPOINT sudo /usr/bin/cubied \
        && echo "Starting CMS Sherpa container" \
        && sleep 20 \
        && bash -c "source /scripts/run.sh"
