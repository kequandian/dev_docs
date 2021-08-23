https://stackoverflow.com/questions/1967370/git-replacing-lf-with-crlf

```shell
$ git config --global core.autocrlf input
```

```
core.autocrlf=true:      core.autocrlf=input:     core.autocrlf=false:

        repo                     repo                     repo
      ^      V                 ^      V                 ^      V
     /        \               /        \               /        \
crlf->lf    lf->crlf     crlf->lf       \             /          \
   /            \           /            \           /            \
```
