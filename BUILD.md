Building bricks-deploy
======================

* Update gem.version in bricks-deploy.gemspec

* Build new gem using

```bash
gem build bricks-deploy.gemspec
```
* Push gem to rubygems.org by executing

```bash
gem push $bricks-deploy-your_version.gem
```

* Don't forget to push to Github