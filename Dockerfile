FROM codercom/code-server:latest
ENV PASSWORD=123456
CMD ["--bind-addr", "0.0.0.0:8080"]
