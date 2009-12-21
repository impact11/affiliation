#!/bin/bash

rake --trace db:drop:all RAILS_ENV=$RAILS_ENV
rake --trace db:create:all RAILS_ENV=$RAILS_ENV
rake --trace db:migrate RAILS_ENV=$RAILS_ENV
rake --trace db:seed RAILS_ENV=$RAILS_ENV
