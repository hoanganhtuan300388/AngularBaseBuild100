import { Component, Renderer2, OnDestroy } from '@angular/core';

@Component({
    selector: 'app-layout-login',
    templateUrl: '../views/layout-login.component.html'
})
export class LayoutLoginComponent implements OnDestroy {
    
    constructor(
        private _renderer: Renderer2
    ) {
        this._renderer.addClass(document.body, 'login-page');
    }

    ngOnDestroy() {
        this._renderer.removeClass(document.body, 'login-page');
    }
    
}