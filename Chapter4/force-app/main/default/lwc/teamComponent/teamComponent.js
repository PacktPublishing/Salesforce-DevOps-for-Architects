import { LightningElement } from 'lwc';

export default class TeamComponent extends LightningElement
{
    message = 'Welcome to the team!';

    handleMessage(event)
    {
        this.message = event.target.value;
    }
}