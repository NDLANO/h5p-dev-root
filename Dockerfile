FROM node:12.18.1 as builder
RUN apt-get update && apt-get install vim less -y
RUN npm install -g h5p
RUN mkdir -p /dev-h5p/cp

# Fetch Dependencies
WORKDIR /dev-h5p
COPY repos .
RUN while read -r repo; do git clone ${repo}; done < ./repos


RUN if [ -d "h5p-editor-color-selector" ]; then cd h5p-editor-color-selector && git checkout b0ae8c941cedcec73df6b186663eae6df8679810; fi

RUN if [ -d "h5p-dialogcards" ]; then cd h5p-dialogcards && npm install && npm run build; fi
RUN if [ -d "h5p-drag-text" ]; then cd h5p-drag-text && npm install && npm run build; fi
RUN if [ -d "h5p-questionnaire" ]; then cd h5p-questionnaire && npm install && npm run build; fi
RUN if [ -d "h5p-drag-question" ]; then cd h5p-drag-question && npm install && npm run build; fi
RUN if [ -d "h5p-interactive-video" ]; then cd h5p-interactive-video && npm install && npm run build; fi
RUN if [ -d "h5p-open-ended-question" ]; then cd h5p-open-ended-question && npm install && npm run build; fi
RUN if [ -d "h5p-simple-multiple-choice" ]; then cd h5p-simple-multiple-choice && npm install && npm run build; fi
RUN if [ -d "h5p-course-presentation" ]; then cd h5p-course-presentation && npm install && npm run build; fi


FROM kentis123/drupal-h5p:drupal-7

COPY --from=builder /dev-h5p sites/default/files/h5p/development