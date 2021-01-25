FROM ruby:2.0.0-slim

LABEL "com.github.actions.name"="Run Rspec"
LABEL "com.github.actions.description"="Run Rspec."
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="red"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN apt-get update && apt-get install -y build-essential git nodejs imagemagick advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant 
ENTRYPOINT ["/entrypoint.sh"]
