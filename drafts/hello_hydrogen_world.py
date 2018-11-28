print "Hello Hydogen world!";

# https://nteract.gitbooks.io/hydrogen/docs/Usage/Examples.html

from IPython.display import JSON

data = {"foo": {"bar": "baz"}, "a": 1}
JSON(data)

from IPython.display import Image
Image('http://mlavi.github.io/img/firefox_nebula.jpg')
Image('devops-cert.png')
Image('/Users/mark/Documents/NotBackedUp/!32456563_1652317718138161_5977375860666138624_n.jpg')
