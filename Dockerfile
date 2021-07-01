FROM python:3.9-slim
RUN apt-get update && apt-get install -y git
RUN pip install --upgrade pip

RUN groupadd -g 1000 -r user && useradd -u 1000 -mr -g user user
RUN mkdir -p /app/src && chown user:user /app

USER user

# copy the docker_ssh folder over
# should only have keys that are safe to publish in the context your container is going to be used in
COPY ./docker_config/ssh /home/user/.ssh

WORKDIR /app/src

COPY ./requirements.txt /app
COPY /src /app/src

# Configure a url."...".insteadOf "..." entry for each project you use
# RUN git config --global url."ssh://{project}-github/{user|org}/{project}".insteadOf "ssh://git@github.com/{user|org}/{project}" \
#     && pip install --no-cache-dir -r requirements.txt


CMD ["python", "app.py"]
