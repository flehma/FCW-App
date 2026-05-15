# Local Development
For local development docker is used. The docker-compose.dev.yml can be used as an override.
1. Copy .env.example and rename it to .env
2. Run 'docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build'

# Building for Production 
If you want to test the production build locally you can simply do the following:
1. Copy .env.example and rename it to .env
2. Run "docker compose up -d"


# Deploying
1. Copy .env.example and rename it to .env
2. Copy the docker-compose.yml file and the init.sql file to your server
3. Run "docker compose up -d"

# Wenn mal wieder alles abgekackt ist, versuch das 
systemctl restart docker
cd ~/FCW-App && docker compose up -d

# Status-Page auf uptimerobot
https://stats.uptimerobot.com/3KXRZ0L1yh 