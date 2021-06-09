init:
	npm i -g h5p

build-course-presentation-image:
	cp course-presentation-repos repos
	docker build . -t course-presentation
	rm repos

run-course-presentation-image: build-course-presentation-image
	# docker run -p 8080:80 \
	# -v ${PWD}/h5p-editor-course-presentation:/var/www/html/sites/default/files/h5p/development/h5p-editor-course-presentation/ \
	# -v ${PWD}/h5p-course-presentation:/var/www/html/sites/default/files/h5p/development/h5p-course-presentation/ \
	# course-presentation
	./docker_run_with_all_local_libs_mounted.sh course-presentation 8081

build-vt360-image:
	cp vt360-repos repos
	docker build . -t vt360
	rm repos

run-vt360-image: build-vt360-image
	./docker_run_with_all_local_libs_mounted.sh vt360 8080

update-all-repos:
	./update-all-repos.sh
