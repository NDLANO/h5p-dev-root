FROM node:16 as builder
RUN apt-get update && apt-get install vim less -y
RUN npm install -g h5p
RUN mkdir -p /dev-h5p/cp

# Fetch Dependencies
WORKDIR /dev-h5p
COPY repos .
RUN while read -r repo; do git clone ${repo}; done < ./repos

RUN if [ -d "h5p-editor-color-selector" ]; then cd h5p-editor-color-selector && git checkout tags/1.2.6; fi
RUN if [ -d "h5p-video" ]; then cd h5p-video && git checkout tags/1.5.6; fi
RUN if [ -d "h5p-audio" ]; then cd h5p-audio && git checkout tags/1.4.7; fi
RUN if [ -d "h5p-blanks" ]; then cd h5p-blanks && git checkout tags/1.12.12; fi
RUN if [ -d "h5p-multi-choice" ]; then cd h5p-multi-choice && git checkout tags/1.14.9; fi
RUN if [ -d "h5p-true-false" ]; then cd h5p-true-false && git checkout tags/1.6.9; fi

RUN if [ -d "h5p-dialogcards" ]; then cd h5p-dialogcards && npm install && npm run build; fi
RUN if [ -d "h5p-drag-text" ]; then cd h5p-drag-text && npm install && npm run build; fi
RUN if [ -d "h5p-questionnaire" ]; then cd h5p-questionnaire && npm install && npm run build; fi
RUN if [ -d "h5p-drag-question" ]; then cd h5p-drag-question && npm install && npm run build; fi
RUN if [ -d "h5p-interactive-video" ]; then cd h5p-interactive-video && npm install && npm run build; fi
RUN if [ -d "h5p-open-ended-question" ]; then cd h5p-open-ended-question && npm install && npm run build; fi
RUN if [ -d "h5p-simple-multiple-choice" ]; then cd h5p-simple-multiple-choice && npm install && npm run build; fi
RUN if [ -d "h5p-interactive-board" ]; then cd h5p-interactive-board && npm install && npm run build; fi
RUN if [ -d "h5p-three-image" ]; then cd h5p-three-image && npm install && npm run build; fi
RUN if [ -d "h5p-editor-three-image" ]; then cd h5p-editor-three-image && npm install && npm run build; fi
RUN if [ -d "h5p-editor-audio-recorder" ]; then cd h5p-editor-audio-recorder && npm install && npm run build; fi
RUN if [ -d "h5p-editor-timeline" ]; then cd h5p-editor-timeline && npm install && npm run build:prod; fi
RUN if [ -d "h5p-timeline" ]; then cd h5p-timeline && npm install && npm run build:prod; fi

FROM kentis123/drupal-h5p:drupal-7

COPY --from=builder /dev-h5p sites/default/files/h5p/development
