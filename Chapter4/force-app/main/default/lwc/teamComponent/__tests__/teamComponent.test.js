import { createElement } from 'lwc'; 
import teamComponent from 'c/teamComponent'; 

describe('c-team-component', () => { 
    afterEach(() => { 
        // The jsdom instance is shared across test cases in a single file so reset the DOM 
        while (document.body.firstChild) { 
            document.body.removeChild(document.body.firstChild); 
        } 
    }); 

    it('renders the correct message', () => { 
        const element = createElement('c-team-component', { 
            is: teamComponent 
        }); 
        document.body.appendChild(element); 

        const pElement = element.shadowRoot.querySelector('lightning-input'); 
        expect(pElement.value).toBe('Welcome to the team!'); 
    }); 
}); 