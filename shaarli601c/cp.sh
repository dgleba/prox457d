	src=shaarli601c_shaarli_1:/var/www/shaarli/data  
	out=/srv/dkr/_copy/sharrlidata
	mkdir -p $out
	docker cp $src $out
