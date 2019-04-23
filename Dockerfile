FROM ubuntu:18.04
LABEL maintainer = "pedrom.araujo@outlook.com"

#Install software
RUN apt-get -y update && apt-get install -y \
  locales\
  language-pack-pt-base \
  vim \
  sudo \
  git \
  curl \
  python3 \
  python3-pip \
  python3-dev \
  mongodb 

RUN pip3 install virtualenv \
    django \
    djangorestframework \
    model_mommy \
    djongo

ENV LANG pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

RUN locale-gen --purge pt_BR.UTF-8
RUN update-locale LANG=pt_BR.UTF-8 LANGUAGE

# RUN mkdir /root/.ssh/

# # Copy over private key, and set permissions
# ADD id_rsa /root/.ssh/id_rsa
# RUN chmod 700 /root/.ssh/id_rsa

# # Create known_hosts
# RUN touch /root/.ssh/known_hosts
# # Add gitlab key
# RUN ssh-keyscan 10.44.10.39 >> /root/.ssh/known_hosts

# RUN eval "$(ssh-agent -s)"

# # # Clone the git files into the docker container
# RUN git clone git@github.com:pemtajo/my-wedding-photos.git

# RUN python3 manage.py makemigrations && python3 manage.py migrate --run-syncdb && python3 manage.py runserver