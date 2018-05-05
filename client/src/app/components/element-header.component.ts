import { Component } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { ComUserLoginService as UserLogin } from '../services/com-user-login.service';

@Component({
    selector: 'app-element-header',
    templateUrl: '../views/element-header.component.html'
})
export class ElementHeaderComponent {
    
    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        public userLogin: UserLogin
    ) {
    
    }
    
    logout() {
        this.userLogin.logout();
        this._router.navigate(['/login']);
    }
}