# use `dc` to start without `frontend` container
alias dc="docker-compose -f docker-compose.yml -f docker-compose.local.yml -f docker-compose.ssl.yml"

# use `dcf` to start with `frontend` container
alias dcf="docker-compose -f docker-compose.yml -f docker-compose.local.yml -f docker-compose.ssl.yml -f docker-compose.frontend.yml"

# use `inapp` to quickly get inside of the app container
alias inapp="docker-compose -f docker-compose.yml -f docker-compose.local.yml -f docker-compose.ssl.yml -f docker-compose.frontend.yml exec -u user app"

# use `infront` to quickly get inside of the frontend container
alias infront="docker-compose -f docker-compose.yml -f docker-compose.local.yml -f docker-compose.ssl.yml -f docker-compose.frontend.yml exec -w /var/www/public/app/design/frontend/Scandiweb/pwa/ frontend"

# use `applogs` to quickly see the last 100 lines of app container logs
alias applogs="docker-compose logs -f --tail=100 app"

# use `frontlogs` to quickly see the last 100 lines of frontend container logs
alias frontlogs="docker-compose -f docker-compose.yml -f docker-compose.local.yml -f docker-compose.ssl.yml -f docker-compose.frontend.yml logs -f --tail=100 frontend"