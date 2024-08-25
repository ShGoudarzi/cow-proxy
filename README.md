## Overview
Cow Proxy is a lightweight, efficient HTTP proxy designed to enhance your network performance and provide secure, private browsing. It can be used to forward HTTP requests, cache content, and manage traffic with minimal configuration. Cow Proxy is suitable for users needing a simple and effective way to navigate the web through a proxy server, whether for privacy, content caching, or bypassing restrictions.

## Features
Lightweight: Minimal resource usage for fast and responsive proxying.
Caching: Supports caching of web content to speed up subsequent requests.
Traffic Management: Can manage and filter HTTP traffic efficiently.
Security: Provides basic anonymity and protection while browsing.

## Installation
To get started with Cow Proxy, you need to clone the repository and install the necessary dependencies.
```
git clone https://github.com/ShGoudarzi/cow-proxy.git
cd cow-proxy
docker compose up -d
```

## Usage
```
curl -I -x http://USERNAME:PASSWORD@SERVER_IP:PORT https://youtube.com
```
