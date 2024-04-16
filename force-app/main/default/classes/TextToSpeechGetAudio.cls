global with sharing class TextToSpeechGetAudio {


 @AuraEnabled
 public static String getAudio(String TextToConvert){
 
    String apiKey = TextToSpeech__mdt.getInstance('APIKey').Value__c;
    String voice = TextToSpeech__mdt.getInstance('Voice').Value__c;
    String countryCode = TextToSpeech__mdt.getInstance('CountryCode').Value__c;
    
    String endpoint = 'https://api.voicerss.org';
   
    String body = 'key=' + apiKey + '&hl=' + countryCode + '&v=' + voice + '&src=' + TextToConvert;
    
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('POST');
    req.setbody(body);
    
    Http http = new Http();
    
    HttpResponse response = http.send(req);
    System.debug('Status Code: ' + response.getStatusCode());
    System.debug('Response Body: ' + response.getBody());
    
    return EncodingUtil.base64Encode(response.getBodyAsBlob());
    
    }
 }
