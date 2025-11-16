# The Hangman Game

This is a Ruby version of the well-known game "Hangman".

Branches:

- develop : For development
- main : For working and current version

Design discussion happens in [excalidraw].

[excalidraw]: https://excalidraw.com/#room=c4ea02d25bf3868d5816,WeklbzxlqZVqfRHt0y58nQ

## Development Setup

Starting work in the `develop` branch will provide all the opinions of
the project.

We chose to use the following:

- [X] [mise]
- [X] [minitest]
- [X] [minitest-reporters]

Once `mise` is installed, you can get a list of tasks available by
doing:

```sh
mise tasks
```

For continuous development, you can run the following tasks:

To setup initially, run:

```sh
mise setup
```

These commands are written such that they will run in the bundled
environment provided by the `Gemfile`.

```sh
mise watch lint
```

```sh
mise watch test
```

[mise]: https://mise.jdx.dev/
[minitest]: https://github.com/minitest/minitest
[minitest-reporters]: https://github.com/minitest-reporters/minitest-reporters
