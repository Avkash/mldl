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
To connect with backend you need to following API:

```
function  PostRestRequest(apiUrl, postBodyData, postResultObj) {
    var data = JSON.stringify(postBodyData)
    return fetch(apiUrl, {
         mode: 'cors',
         method: 'POST',
         body: data,
         json: true,
         headers: new Headers({
             'Content-Type': 'application/json',
             Accept: "application/json"
         })
       },
     )
     .then(checkStatus)
     .then(parseJSON)
     .then(postResultObj);
} 

function checkStatus(response) {
  if (response.status >= 200 && response.status < 300) {
    return response;
  }
  const error = new Error(`HTTP Error ${response.statusText}`);
  error.status = response.statusText;
  error.response = response;
  console.log(error);
  throw error;
}

function parseJSON(response) {
  return response.json();
}

const PostRestObject = { PostRestRequest };
export default PostRestObject;
```

In the specific java scrpipt page now you can call the API as below:

```
GetRequestedDetails = (varId) => {
        let { RequestJsonKey } = this.state;      
        RequestJsonKey.keyType = 'INFO';
        RequestJsonKey.keyFilters['keyInfo'].values = [];
        RequestJsonKey.keyFilters['keyInfo'].values.push(varId);
        this.setState({
          RequestJsonKey: RequestJsonKey,
        })    
        var postData = {
          RequestType: 'API',
          RequestJson: this.state.RequestJsonKey
        }    
        PostRestObject.PostRestRequest(`api/v1/[END_POINT_NAME]/`, postData, postResultObj => {
          if (postResultObj.resultCode === "SUCCESS") {
            this.setState({
              renferenceObject:postResultObj.resultData,
            }, () => {
            });
          } 
        });
    }
 ```
