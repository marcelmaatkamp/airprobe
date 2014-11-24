FROM marcelmaatkamp/libosmocore:latest

MAINTAINER m.maatkamp@gmail.com version: 0.1

# ---
# Airprobe
# http://www.rtl-sdr.com/rtl-sdr-tutorial-analyzing-gsm-with-airprobe-and-wireshark/
# http://www.data.ks.uni-freiburg.de/download/comsysSS12/7.Lecture_2012-06-15/exercise06-Analyse.pdf

# RUN git clone git://git.gnumonks.org/airprobe.git

ADD A5.1/ /gnuradio/airprobe/A5.1
ADD gsm-receiver/ /gnuradio/airprobe/gsm-receiver/
ADD gsm-tvoid/ /gnuradio/airprobe/gsm-tvoid/
ADD gsmdecode/ /gnuradio/airprobe/gsmdecode/
ADD gsmsp/ /gnuradio/airprobe/gsmsp/
ADD gsmstack/ /gnuradio/airprobe/gsmstack/
ADD gssm/ /gnuradio/airprobe/gssm/
ADD viterbi-detector/ /gnuradio/airprobe/viterbi-detector/
ADD viterbi_generator/ /gnuradio/airprobe/viterbi_generator/

RUN wget -o /gnuradio/airprobe/zmiana.patch https://raw.githubusercontent.com/scateu/airprobe-3.7-hackrf-patch/master/zmiana.patch 
RUN cd airprobe && patch -p1 < zmiana.patch

RUN cd airprobe/gsmdecode && ./bootstrap && ./configure && make
# RUN cd airprobe/gsm-receiver && ./bootstrap && ./configure && make

ENTRYPOINT      ["/bin/bash"]
