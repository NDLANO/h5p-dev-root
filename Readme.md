# H5P development root directory

The purpose of this repository is to provide a general root directory for H5P content types.

## Usage

In order to develop course-presentation:

1. Clone `h5p-course-presentation` and `h5p-editor-course-presentation` into this directory
1. in the `h5p-course-presentation` run `npm watch`
1. If you need to alter additional libraries, clone those libraries into the current library
1. run `make run-course-presentation-image`

See that your folder structure now looks something like this:

```dir
  h5p-dev-root                          # Dev root
  ├── h5p-course-presentation
  ├── h5p-editor-course-presentation
  └── ...                               # Other H5P libraries that you want to override
```

Now you should be able to edit the cloned libraries and test continuously.

## Note

Directories that starts with `h5p-` are ignored from the Docker context, meaning that they are not available to Docker builds. This is done to reduce the size of the context sent to Docker.
