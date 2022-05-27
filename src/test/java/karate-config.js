function fn() {
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  var port = karate.properties['port'] ;
  var env = karate.env;

   var protocol = 'https';
   var config = {baseUrl: protocol + '://reqres.in'};

  return config;
}
