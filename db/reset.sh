#!/bin/bash

rake --trace db:drop:all
rake --trace db:create:all
rake --trace db:migrate
rake --trace db:seed
