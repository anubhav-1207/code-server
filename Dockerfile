FROM codercom/code-server:latest

# Switch to root for installing packages and creating symlink
USER root

# Install Python + pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Make 'python' point to python3
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Switch back to normal user
USER coder

# Set VS Code password
ENV PASSWORD=123456

# Bind to Render's assigned port
CMD ["--bind-addr", "0.0.0.0:${PORT}"]
