# Setting up Proxy connection to backend from React CoreUI #

```
const proxy = require('http-proxy-middleware');
module.exports = function(app) {
  app.use(
    '/api',
    proxy({
      target: 'http://localhost:<PORT_NUMBER>',
      changeOrigin: true,
    })
  );
};
```
