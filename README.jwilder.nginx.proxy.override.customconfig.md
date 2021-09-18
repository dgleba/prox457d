
# Intro

This is a way to completely override the automatic generation of the nginx config.

This way a custom setup can be achieved while still using let's encrypt companion to get SSL.



# Reference files:



sftp://172.27.0.30/srv/dkr/proxy457d/docker-compose.yml

      # I added to the bottom of the template and commented it.
      - ./nginx2.tmpl:/app/nginx.tmpl
      # Now lines can be added to the bottom of the generated config from files from here..
      - ./vol/nginx/jwilder-nginx-override:/etc/nginx/jwilder-nginx-override


_____________


sftp://172.27.0.30/srv/dkr/proxy457d/nginx2.tmpl

#
# nginx2.tmpl modified by David Gleba 2020-04-16
#
# 1.
# The stanza that generates each vhost config is marked below.
# Copy it and edit as you wish. You could use a custom env variable like OVERRIDE_VIRTUAL_HOST=my.example.com
# in docker-compose.yml instead of VIRTUAL_HOST=my.example.com and use your custom template code to generate
# anything you wish for a particular vhost.
# See the marker at approx line 206 like the one just below this line. 
#   There is another one at the end of the stanza.
# 11 vhosts stanza ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# 2.
# 	Custom sections that are added to the bottom of the generated config are at the end of the file.
#	See the bottom of the file 
#
#


...

# 99 custom literal text configs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Below are: custom includes to completely override a vhost.
#
# do not use the VIRTUAL_HOST env variable in docker-compose for these vhosts.
# these have no template language in them. Just literal text.
# To use template language the template would have to be in this file as no other file
# is processed by docker-gen in this project.
#

include /etc/nginx/jwilder-nginx-override/*.conf;


_____________

 

sftp://172.27.0.30/srv/dkr/proxy457d/vol/nginx/jwilder-nginx-override

	Folder from which all files are loaded to the bottom of the nginx config.



