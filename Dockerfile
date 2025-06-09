ARG N8N_PORT

FROM n8nio/n8n:latest

# Expose the port that n8n runs on
EXPOSE ${n8n_port}

# Create and set a volume for n8n data persistence
VOLUME ["/home/node/.n8n"]