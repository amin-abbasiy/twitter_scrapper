#FROM put repo url here

# Copy the Rails application into place
#COPY twitter_scrapper .
#
#RUN mkdir -p log

#for exposing port
#ENV EXPOSE_PORT="8282"
#EXPOSE $EXPOSE_PORT
#VOLUME [ "/files" ]

## Entrypoint -> for ruby rake command if you want to all
#ENTRYPOINT [ "./docker/scripts/entry.sh" ]
#
## Health Check for web base api if you want to stay online
#HEALTHCHECK --interval=30s --timeout=5s \
#CMD docker/scripts/healthcheck.sh

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
#CMD "app"