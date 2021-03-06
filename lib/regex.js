// Generated by CoffeeScript 1.6.3
(function() {
  var name, r, regex, _fn;

  regex = {
    NICK: /^[A-Z_\-\[\]\\^{}|`][A-Z0-9_\-\[\]\\^{}|`]*$/i,
    PASSWORD: /^[^\s]{5,}$/,
    EMAIL: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i,
    KEY: /^[A-Z0-9]+$/i
  };

  _fn = function(r) {
    return exports[name.toLowerCase()] = function(s) {
      return !r.test(s);
    };
  };
  for (name in regex) {
    r = regex[name];
    _fn(r);
  }

}).call(this);
