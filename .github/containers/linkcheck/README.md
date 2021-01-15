# Building the Container

```
docker build -t jadudm:linkcheck .
```

# Running the Container

With no parameters, linkcheck will test `http://localhost:4000/`. To test `localhost`, note that the `--network="host"` option to `docker run` is necessary.

```
docker run --rm -it --network="host" jadudm:linkcheck
```

To test a remote site:

```
docker run --rm -it jadudm:linkcheck --https --host "jadud.com"
```

When you select the HTTP scheme, the port is automatically set to 443. If you are testing an HTTP URL on a port other than 4000, you should set the port explicitly.

You can see the options that `linkcheck` provides by asking for help:

```
docker run --rm -it jadudm:linkcheck --help
```
