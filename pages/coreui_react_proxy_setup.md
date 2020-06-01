## Package.json Setup:
```
  "devDependencies": {
    "react-scripts": "^3.4.1",
    "http-proxy-middleware": "0.19.1"
  },
```

## Define setupProxy.js
```
const proxy = require('http-proxy-middleware');
module.exports = function(app) {
  app.use(
    '/v1',
    proxy({
      target: 'http://localhost:3003',
      changeOrigin: true,
    })
  );
};
```

## POST Setup

Setup api/ConnectServerPost.js as below:
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

When required call as below:
```
import PostRestObject from '../../api/ConnectServerPost';
```

## Get Setup

Setup api/ConnectServerGet.js as below:
```
function GetRestRequest(apiUrl, getResultObj) {
    return fetch(apiUrl, {
         mode: 'cors',
         method: 'GET',
         json: true,
         headers: new Headers({
             'Content-Type': 'application/json',
             Accept: "application/json"
         })
       },
     )
     .then(checkStatus)
     .then(parseJSON)
     .then(getResultObj);
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

const GetRestObject = { GetRestRequest };
export default GetRestObject;
```
When required call as below:
```
import GetRestObject from '../../api/ConnectServerGet';
```

## Usage

```
import GetRestObject from '../../api/ConnectServerGet';
import PostRestObject from '../../api/ConnectServerPost';

....
....

    GetRequestedDetails = () => {
      GetRestObject.GetRestRequest(`/v1/hello`, getResultObj => {
        console.log(getResultObj);
      });
    }

    PostRequestedDetails = () => {
      var postData = {
        RequestType: 'api',
        RequestJson: {'param':'value'}
      }    
      PostRestObject.PostRestRequest(`/v1/bye`, postData, postResultObj => {
        console.log(postResultObj);
      });
    }

    componentDidMount(){
      this.GetRequestedDetails()
      this.PostRequestedDetails()   
    }
```
 
    

