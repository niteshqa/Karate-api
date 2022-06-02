function fn() {
  var port = karate.properties['port'] ;
  var env = karate.env;
  var protocol = 'https';

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  if (!env) { env = 'demo'}
  if (!port) { port = 8443}

    karate.log("environment:", env)
    karate.log("port:", port)

   var config = {baseUrl: protocol + '://reqres.in'};

   if (env == 'QA') {
   config.baseUrl = protocol + '://reqres.in'}

  return config;
}
