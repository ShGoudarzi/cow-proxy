# Stage 1: Download the cow binary
FROM alpine:latest as builder

# Install curl to download the cow script
RUN apk --no-cache add curl bash \
    && curl -s -L git.io/cow | bash \
    && chmod +x /cow

# Stage 2: Create a minimal image with nc for health checks
FROM alpine:latest

# Install netcat-openbsd for health checks
RUN apk --no-cache add netcat-openbsd

# Copy the binary from the builder stage
COPY --from=builder /cow /cow

# Expose the port used by the application
EXPOSE 7777/tcp

# Health check to verify if the port is open using nc
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD nc -z localhost 7777 || exit 1

# Set the entrypoint to the command that was downloaded
ENTRYPOINT ["/cow"]
