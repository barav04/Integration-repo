// catFact.js
import { LightningElement, wire } from 'lwc';
import getRandomCatFact from '@salesforce/apex/CatFactService.getRandomCatFact';

export default class CatFact extends LightningElement {
    fact;

    @wire(getRandomCatFact)
    wiredFact({ error, data }) {
        if (data) {
            this.fact = data;
        } else if (error) {
            this.fact = 'Error fetching fact';
        }
    }
}
