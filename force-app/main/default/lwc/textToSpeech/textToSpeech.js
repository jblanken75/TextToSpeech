import { LightningElement,api,track } from 'lwc';
import getAudio from '@salesforce/apex/TextToSpeechGetAudio.getAudio';

export default class VoiceRSSTextToSpeech extends LightningElement {
    @api inputText = '';
    audioUrl;
    blobUrl;
    showAudio = false;
    listenVariant = "brand";
    buttonIcon = "utility:listen";

    @track rendered = false;

    //Original code for simple GET request
   /* convertToSpeech() {
        this.audioUrl = "https://api.voicerss.org/?key=" + this.keyId + "&hl=en-us&src=" + encodeURIComponent(this.inputText);
    } */

    convertToSpeech() {
        if (!this.showAudio) {
            getAudio({TextToConvert: this.inputText}) 
                .then(result => {
                    const byteCharacters = atob(result);
                    const byteNumbers = new Array(byteCharacters.length);
                    for (let i = 0; i < byteCharacters.length; i++) {
                        byteNumbers[i] = byteCharacters.charCodeAt(i);
                    }   
                    const byteArray = new Uint8Array(byteNumbers);            
                    const contentType = 'audio/wav'; 
                    const blob = new Blob([byteArray], {type: contentType});
                
                    this.blobUrl = URL.createObjectURL(blob);
                    this.showAudio = true;
                    this.listenVariant = "brand-outline";
                    this.buttonIcon = "utility:stop"; 
                                   
                })
                .catch(error => {
                    this.response = error;
                    console.log("Got Error: " + error);
                });
        }
        else {
            this.showAudio = false;
            this.listenVariant = "brand";
            this.buttonIcon = "utility:listen";
        }
    }

 
}