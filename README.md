## Overview

Work in progress. A meteor test-packages driver-package to run [mocha.js](http://mochajs.org/) package tests using [practicalmeteor:mocha](https://atmospherejs.com/practicalmeteor/mocha). 

## Usage

### Writing mocha.js package tests

In your package.js:

```javascript

Package.onTest(function(api) {
  api.use('practicalmeteor:mocha@2.0.1-rc0');
  api.use('my-package');
  api.addFiles('my-mocha-tests.js');
  ...
});
```

### Testing app packages

From your app folder:

```bash

meteor test-packages --driver-package practicalmeteor:mocha-web-driver [package...]
```

### Testing packages independently

From your package folder:

```bash

meteor test-packages --driver-package practicalmeteor:mocha-web-driver ./
```

## Contributing

See [Contribution Guide](ContributionGuide.md)

## License

[practicalmeteor:mocha](https://github.com/practicalmeteor/meteor-mocha/blob/master/LICENSE.md)

