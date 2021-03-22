FROM node:12.18.1 as builder
RUN apt-get update && apt-get install vim less -y
RUN npm install -g h5p
RUN mkdir -p /dev-h5p/cp

# Fetch Dependencies
WORKDIR /dev-h5p
COPY repos .
RUN while read -r repo; do git clone ${repo}; done < ./repos

RUN if [ -d "h5p-editor-color-selector" ]; then cd h5p-editor-color-selector && git checkout b0ae8c941cedcec73df6b186663eae6df8679810; fi

COPY repos .
RUN while read -r repo; do \
  DIRECTORY=$(echo ${repo} | cut -d "/" -f 5 | sed "s/.git//") && \
  cd ${DIRECTORY} && \
  \
  if [-f "./package.json"]; then \
    ls -l && \
    npm ci && \
    npm run build --if-present; \
  fi && \
  \
  cd ..; \
  done < ./repos; 

FROM kentis123/drupal-h5p:drupal-7

COPY --from=builder /dev-h5p sites/default/files/h5p/development
