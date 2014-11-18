Package.describe({
  name: "practicalmeteor:google-translate",
  summary: "Server side synchronous google translate.",
  git: "https://github.com/practicalmeteor/meteor-google-translate.git",
  version: '0.9.0-rc0'
});

Npm.depends({'google-translate': '0.1.4'});

Package.onUse(function (api) {
  api.versionsFrom('0.9.3');

  api.use('coffeescript');
  api.use('underscore');

  api.use(['practicalmeteor:loglevel@1.1.0_2', 'spacejamio:chai@1.9.2_2']);

  // Uncomment once we upgrade to loglevel v2, with package specific loggers
  // api.addFiles('src/lib/log.js');

  api.addFiles([
    'src/server/GoogleTranslate.coffee'
  ], "server");
});

Package.onTest(function (api) {
  api.use([
    'coffeescript',
    'practicalmeteor:google-translate@0.9.0-rc0',
    'practicalmeteor:loglevel@1.1.0_2',
    'tinytest']);

  api.addFiles('tests/GoogleTranslateTest.coffee');
});
