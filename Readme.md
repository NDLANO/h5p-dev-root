# H5P development root directory

The purpose of this repository is to provide a general root directory for H5P content types.

## Usage

In order to develop interactive-board:

1. Clone `h5p-interactive-board` and `h5p-editor-interactive-board` into this directory
1. in the `h5p-interactive-board` run `npm watch`
1. If you need to alter additional libraries, clone those libraries into the current library
1. run `make run-interactive-board-image`

See that your folder structure now looks something like this:

```dir
  h5p-dev-root                          # Dev root
  ├── h5p-interactive-board
  ├── h5p-editor-interactive-board
  └── ...                               # Other H5P libraries that you want to override
```

Now you should be able to edit the cloned libraries and test continuously. In Drupal, the username and passwords are `admin` and `admin` respectively.

## Note

Directories that starts with `h5p-` are ignored from the Docker context, meaning that they are not available to Docker builds. This is done to reduce the size of the context sent to Docker.
