Package.describe({
  name: "practicalmeteor:google-translate",
  summary: "Server side synchronous google translate.",
  git: "https://github.com/practicalmeteor/meteor-google-translate.git",
  version: '0.9.0-rc0'
});

Npm.depends({'googleapis': '1.0.21'});

Package.onUse(function (api) {
  api.versionsFrom('0.9.3');

  api.use('coffeescript', 'server');
  api.use(['practicalmeteor:loglevel@1.1.0_2', 'practicalmeteor:chai@1.9.2_3'], 'server');

  // Uncomment once we upgrade to loglevel v2, with package specific loggers
  // api.addFiles('src/lib/log.js');

  api.addFiles([
    'src/server/GoogleTranslate.coffee'
  ], "server");

  //api.export('GoogleTranslate', 'server');
});

Package.onTest(function (api) {
  api.use([
    'coffeescript',
    'practicalmeteor:google-translate',
    'practicalmeteor:loglevel@1.1.0_2',
    'practicalmeteor:chai',
    'tinytest'], 'server');

  api.addFiles('tests/server/GoogleTranslateTest.coffee', 'server');
});
