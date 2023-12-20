# rpmlint-action

This action provides simplified RPM linting via 'rpmlint'.

# Usage

Every option provided by the latest release of 'rpmlint' can be passed as an argument. Here's a simple example workflow:

```
jobs:
  example:
    runs-on: ubuntu-latest

    permissions: {}

    name: rpmlint
    steps:
      - name: Lint RPM
        uses: EyeCantCU/rpmlint-action@v0.1.0
        with:
          rpmfiles: |
            example.rpm
            example.src.rpm
            example.spec
```

Keep in mind, 'rpmlint' can be used for RPMs, source RPMs, and spec files.

# FAQ

## Why not a composite action?

After all, 'rpmlint' can be installed directly on an Ubuntu runner, right?

The package for Ubuntu is fairly behind the current release. As of writing this, Ubuntu uses 'rpmlint' 2.2.0 where as Fedora is on 2.4.0. 'rpmlint' could be installed via pip, but that would take even more time than building a minimal image that provides it separately from the main action and retrieving it for use when needed. When it's all said and done, we might as well use it on RPM's flagship platform.

## Why install 'rpmlint' in a separate container?

Installing 'rpmlint' alongside all of its dependencies takes a notable amount of time, and this significantly reduces the time taken.
