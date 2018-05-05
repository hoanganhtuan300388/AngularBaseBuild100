import { Component } from '@angular/core';

import { environment } from '../../environments/environment';
import { ComUserLoginService as UserLogin } from '../services/com-user-login.service'

@Component({
    selector: 'app-user-profile',
    templateUrl: '../views/user-profile.component.html'
})
export class UserProfileComponent {

    public roles: object = environment.userRoles;

    constructor(
        public userLogin: UserLogin
    ) {
        
    }

}