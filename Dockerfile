FROM ubuntu:latest

WORKDIR interp

RUN apt update && apt install -y python3-pip git wget
RUN git clone https://github.com/timbmg/Sentence-VAE
RUN pip install numpy nltk torch tensorboardX
WORKDIR Sentence-VAE
RUN chmod +x ./dowloaddata.sh
RUN ./dowloaddata.sh

ENTRYPOINT python3 train.py -rn rnn -bs 64
