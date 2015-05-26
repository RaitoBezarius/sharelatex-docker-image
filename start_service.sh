#!/bin/bash
docker run --name SLaTeXMongo -d mongo:2.6 --smallfiles
docker run --name SLaTeXRedis -d redis
docker run -d \
	-v ~/.sharelatex_data:/var/lib/sharelatex \
	-p $1:80 \
	--name SLaTeX \
	--env SHARELATEX_SITE_URL="http://$0:$1" \
	--env SHARELATEX_APP_NAME="Yvan's ShareLaTeX" \
	--link SLaTeXMongo:mongo \
	--link SLaTeXRedis:redis \
	sharelatex
