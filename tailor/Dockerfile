FROM ruby:2.0.0-slim

LABEL "com.github.actions.name"="Run bundler-audit"
LABEL "com.github.actions.description"="Run bundler-audit, patch-level verification for bundler."
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="red"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN sudo apt-get update && apt-get install -y git
ENTRYPOINT ["/entrypoint.sh"]
