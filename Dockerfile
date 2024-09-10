# Stage 1: Download the cow binary
FROM alpine:latest as builder

# Install curl to download the cow script
RUN apk --no-cache add curl bash \
    && curl -s -L git.io/cow | bash \
    && chmod +x /cow

# Stage 2: Create a minimal image
FROM alpine:latest

# Copy the binary from the builder stage
COPY --from=builder /cow /cow

# Expose the port used by the application
EXPOSE 7777/tcp

# Optional: Add a health check (for example, check if the application is running)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:7777 || exit 1

# Set the entrypoint to the command that was downloaded
ENTRYPOINT ["/cow"]
