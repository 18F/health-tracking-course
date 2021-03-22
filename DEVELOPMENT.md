# A very short development guide

This is a placeholder for a better guide. In part, because it is unclear where this site will ultimately live. 

Build process may, therefore, change.

## To build the container

First, you will need to build a Docker container. This container will have within it all the Jekyll goodness you need to build and preview this site.

```
docker build -t pomd/build .
```

## To build the site

Once you have built the container, you can use it to build the site. If you pass the `-b` flag to the container, it will build the site, and leave the output in `_site`. This is useful for deployment to a remote host.

The first time you do this, it may be slow/take some time.

```
docker run -ti --rm -p 4000:4000 -v ${PWD}:/site pomd/build:latest -b 
```

## To serve and test the site

To serve the site (for local testing while developing content), use the `-s` flag.

```
docker run -ti --rm -p 4000:4000 -v ${PWD}:/site pomd/build:latest -s
```

