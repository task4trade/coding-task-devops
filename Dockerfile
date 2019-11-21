FROM node:10.17.0 AS build-env
ADD . /coding-task-devops
WORKDIR /coding-task-devops
RUN npm install 

FROM gcr.io/distroless/nodejs:debug
COPY --from=build-env /coding-task-devops /
#WORKDIR /app
EXPOSE 5000
CMD ["app.js"]
