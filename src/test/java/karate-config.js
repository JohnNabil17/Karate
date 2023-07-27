function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'staging';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'admin1',
    password: 'welcome',
    _url : 'https://jsonplaceholder.typicode.com'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.username = 'author';
    config.password = 'authorpassword';
  } else if (env == 'e2e') {
    // customize
    config.username = 'user';
    config.password = 'userpassword';
  }else if (env == 'staging') {
    // customize
    config.username = 'stagingadmin1';
    config.password = 'stagingwelcome';
  }else if (env == 'preprod') {
    // customize
    config.username = 'user';
    config.password = 'userpassword';
  }else if (env == 'prod') {
    // customize
    config.username = 'user';
    config.password = 'userpassword';
  return config;
}