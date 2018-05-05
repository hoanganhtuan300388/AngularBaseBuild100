import { Component } from '@angular/core';

import { ComContentHeaderService as ContentHeader } from '../services/com-content-header.service';

@Component({
    selector: 'app-element-content-header',
    templateUrl: '../views/element-content-header.component.html'
})
export class ElementContentHeaderComponent {
    
    constructor(
        public contentHeader: ContentHeader
    ) {

    }
    
}