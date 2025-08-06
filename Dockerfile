FROM codercom/code-server:latest

# Switch to root for installations
USER root

# Install Python + pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Make 'python' point to python3 permanently
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Create VS Code settings for Code Runner to run Python in terminal
RUN mkdir -p /home/coder/.local/share/code-server/User \
    && echo '{ \
        "code-runner.runInTerminal": true, \
        "code-runner.runInOutput": false, \
        "code-runner.executorMap": { "python": "python3" } \
    }' > /home/coder/.local/share/code-server/User/settings.json

# Switch back to normal 'coder' user
USER coder

# Set VS Code password (change this if you want)
ENV PASSWORD=123456

# Bind to Render's assigned port
CMD ["--bind-addr", "0.0.0.0:${PORT}"]
