#! /bin/bash

mounts=""
for lib in h5p*/
do
    echo $lib
    mounts="${mounts} -v ${PWD}/${lib}:/var/www/html/sites/default/files/h5p/development/${lib}"
done

echo $mounts

docker run --rm -d -p 8080:80 $mounts $1