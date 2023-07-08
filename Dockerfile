FROM ubuntu 

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y python3 python3-pip git

# RUN git clone --recurse-submodules https://github.com/imartinez/privateGPT.git

COPY . /privateGPT

WORKDIR /privateGPT

RUN pip3 install -r requirements.txt && \
cp example.env .env &&\
python3 ingest.py

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "70", "--reload" ]