# sraplus-deps

Dependency analysis of the [sraplus](https://github.com/DanOvando/sraplus)
package.

The `sraplus` package depends on several packages, which in turn depend on other
packages. How many are they in total? The answer may change from week to week
and this workflow calculates the current number of dependencies.

## How to run

Install the TAF package from CRAN. Then open R in the `sraplus-deps` directory
and run:

```
library(TAF)
taf.boot()
source.all()
```
