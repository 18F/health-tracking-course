# Building and serving the site

```
docker run -ti --rm -p 4000:4000 -v /Users/matthewcjadud/git/cms/cms-federalist:/site jadudm/build:latest -b
```

```
docker run -ti --rm -p 4000:4000 -v /Users/matthewcjadud/git/cms/cms-federalist:/site jadudm/build:latest -s
```