FROM postman/newman:alpine

RUN npm install -g newman-reporter-htmlextra

WORKDIR /etc/newman

ENTRYPOINT ["newman"]

CMD ["run", "src/postman/Restful-Booker API Suite.postman_collection.json", \
     "-e", "src/postman/Restful-Booker Prod.postman_environment.json", \
     "-r", "htmlextra", \
     "--reporter-htmlextra-export", "reports/htmlextra/report.html"]