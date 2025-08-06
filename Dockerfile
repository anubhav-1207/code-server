FROM codercom/code-server:latest

# Switch to root
USER root

# Install Python + pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Switch back to coder user (important for code-server to run normally)
USER coder

# Set VS Code password
ENV PASSWORD=123456

# Bind to Render's port
CMD ["--bind-addr", "0.0.0.0:8080"]
