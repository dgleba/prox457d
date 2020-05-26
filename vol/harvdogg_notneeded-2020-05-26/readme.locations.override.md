#### Pre-VIRTUAL_HOST custom location blocks

In some circumstances you may want to override nginx's default `/` location block behavior.  
Typically, this block acts as a catch-all in order to forward requests not already 
matched by a specific `location` block directly onto your container as-is.

To provide your own location blocks and bypass the automatic generation of them, 
simply add your location blocks to a configuration file file under `/etc/nginx/vhost.d` 
like in the other Per-VIRTUAL_HOST sections except with the suffix `_locations`. 
Notice the 's' to make the filename plural.  
The contents of this file will replace all auto-generated location blocks.
Additionally, this file will take priority over the previously described 
location configuration.

When using location overrides, you are responsible for handling any requests that should be 
forwarded to your container. Passing a request to your container is done using the `proxy_pass` 
instruction within your defined location blocks.  `proxy_pass` expects a qualified hostname in order
to forward a request.  By default, nginx-proxy aliases containers to the defined `VIRTUAL_HOST` name.  
So if you launch your container with a `VIRTUAL_HOST` value of `app.example.com`, then forwarding a 
request to your container would look something like this:

```
	location / {
		proxy_pass http://app.example.com;
	}
```

If you are using an SSL-enabled container, you would use `https://` in place of `http://`.  
You could include any number of other location blocks for nginx to consider and even forward requests 
to external hosts when they match certain conditions.  You can also use any other rules and instructions
available to nginx location blocks.

