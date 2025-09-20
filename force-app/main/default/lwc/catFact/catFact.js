// catFact.js
import { LightningElement, wire } from 'lwc';

import getUserRepos from '@salesforce/apex/GitHubService.getUserRepos';

export default class CatFact extends LightningElement {
    fact;
    repos = [];
    error;
    
    @wire(getUserRepos)
    wiredRepos({ error, data }) {
        if (data) {
            console.log('in');
            this.repos = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body ? error.body.message : error.message;
            this.repos = [];
        }
    }
}
