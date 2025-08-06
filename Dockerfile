FROM codercom/code-server:latest
ENV PASSWORD=yourpassword
CMD ["--bind-addr", "0.0.0.0:${PORT}"]
