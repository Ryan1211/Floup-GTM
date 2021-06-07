___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Floup AI Customer support chatbot",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "This tag allows you to easily implement your Floup AI customer support chatbot on your website.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "chatBotId",
    "displayName": "Chatbot ID:",
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "chatBotTheme",
    "displayName": "Chatbot theme:",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "light",
        "displayValue": "Light theme"
      },
      {
        "value": "dark",
        "displayValue": "Dark theme"
      }
    ],
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require("injectScript");
const callLater = require("callLater");
const callInWindow = require("callInWindow");

var attempts = 0;

function startFloup() {
   attempts += 1;
  
   injectScript("https://ai-customer-support-chat.rbinfinity.repl.co/script.js", function() {
       callInWindow("floup.setKey", [data.chatBotId]);
       callInWindow("floup.createChatButton", [data.chatBotTheme]);
     
        data.gtmOnSuccess();
    }, function() {
       if(attempts <= 5) {
          callLater(function() {
              startFloup();
          });
       }
    });
}

startFloup();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://ai-customer-support-chat.rbinfinity.repl.co/script.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "floup"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 06/06/2021, 16:06:55


