FROM alpine:latest

# Install dependencies and run the curl command in one step to minimize layers
RUN apk --no-cache add curl bash \
    && curl -s -L git.io/cow | bash

# Expose the port
EXPOSE 7777/tcp

# Set the entrypoint to the command that was downloaded
ENTRYPOINT ["/cow"]
