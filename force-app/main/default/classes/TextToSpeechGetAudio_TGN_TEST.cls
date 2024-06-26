/* Generated by TestGen on Tue Apr 9 2024 at 5:45 PM (GMT) */
@isTest
private class TextToSpeechGetAudio_TGN_TEST{
    private class TextToSpeechGetAudio_HCM_TGN_TEST implements HttpCalloutMock{
        protected Integer code;
        protected String status;
        protected String body;
        protected Map<String,String> headers;
        public TextToSpeechGetAudio_HCM_TGN_TEST(Integer code,String status,String body,Map<String,String> headers){
            this.code=code;
            this.status=status;
            this.body=body;
            this.headers=headers;
        }
        public HTTPResponse respond(HTTPRequest req){
            HttpResponse res=new HttpResponse();
            res.setStatusCode(this.code);
            res.setStatus(this.status);
            res.setBody(this.body);
            if(this.headers!=null){
                for(String key:this.headers.keySet()){
                    res.setHeader(key,this.headers.get(key));
                }
            }
            return res;
        }
    }
    @isTest
    private static void getAudio_TGN_TEST(){
        Test.startTest();
        TextToSpeechGetAudio_HCM_TGN_TEST httpMock;
        httpMock=new TextToSpeechGetAudio_HCM_TGN_TEST(200,'Complete','{}',null);
        Test.setMock(HttpCalloutMock.class,httpMock);
        TextToSpeechGetAudio.getAudio('a');
        httpMock=new TextToSpeechGetAudio_HCM_TGN_TEST(200,'Complete','{}',null);
        Test.setMock(HttpCalloutMock.class,httpMock);
        TextToSpeechGetAudio.getAudio('');
        Test.stopTest();
    }
    @isTest
    private static void TextToSpeechGetAudio_TGN_TEST(){
        TextToSpeechGetAudio obj = new TextToSpeechGetAudio();
    }
}