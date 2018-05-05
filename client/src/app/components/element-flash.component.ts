import { Component, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute, NavigationStart } from '@angular/router';
import { Subscription } from 'rxjs/Subscription';

import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-element-flash',
    templateUrl: '../views/element-flash.component.html'
})
export class ElementFlashComponent implements OnDestroy {

    private _subscription: Subscription;

    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        public flash: Flash
    ) {
        this._subscription = this._router.events
            .filter((event) => event instanceof NavigationStart)
            .subscribe((val) => {
                if (this.flash.afterInit === true) {
                    this.flash.afterInit = false;
                } else {
                    if(this.flash.display !== false) {
                        this.flash.close();
                    }
                }
            });
    }

    ngOnDestroy() {
        this._subscription.unsubscribe();
    }

    close() {
        this.flash.close();
    }
}