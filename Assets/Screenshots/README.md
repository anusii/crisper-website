To create the grey scale version of the screenshot for display on the
web page:

```console
convert fname.png -set colorspace Gray -separate -average -blur 2x4 fname_filter.png
```
