# H5P development root directory

The purpose of this repository is to provide a general root directory for H5P content types.

## Usage

In order to develope course-presentation:

* Clone `h5p-course-presentation`  and `h5p-editor-course-presentation` into this directory
* If you need to alter additional libraries, clone those libraries into the current library
* run `make run-course-presentation-image`

Now you should be able to edit the cloned libraries and test continuously.

## NB

Directories that starts with `h5p-` are ignored from the docker context, meaning that they are not availble to docker builds. This is done to reduce the size of the context sent to docker.