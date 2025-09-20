import { LightningElement, track } from 'lwc';

export default class LifecycleExample extends LightningElement {
    @track time;
    intervalId;

    constructor() {
        super();
        console.log('constructor: Component created');
    }

    connectedCallback() {
        console.log('connectedCallback: Component inserted into DOM');
        
        // Example: start a timer
        this.intervalId = setInterval(() => {
            this.time = new Date().toLocaleTimeString();
            console.log('Time updated:', this.time);
        }, 1000);
    }

    renderedCallback() {
        console.log('renderedCallback: DOM just rendered/re-rendered');
        
        // Example: manipulate DOM safely
        const elem = this.template.querySelector('.time-box');
        if (elem) {
            elem.style.color = 'blue';
        }
    }

    disconnectedCallback() {
        console.log('disconnectedCallback: Component removed from DOM');
        
        // Cleanup
        clearInterval(this.intervalId);
    }

    errorCallback(error, stack) {
        console.error('errorCallback: An error occurred', error, stack);
    }
}
