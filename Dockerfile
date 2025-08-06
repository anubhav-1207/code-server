FROM codercom/code-server:latest

# Switch to root
USER root

# Install Python + pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Make 'python' point to python3 permanently
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Create VS Code settings folder & set defaults
RUN mkdir -p /home/coder/.local/share/code-server/User
COPY settings.json /home/coder/.local/share/code-server/User/settings.json

# Switch back to coder user
USER coder

# Set your VS Code password (change it here)
ENV PASSWORD=123456

# Bind to Render's assigned port
CMD ["--bind-addr", "0.0.0.0:${PORT}"]
