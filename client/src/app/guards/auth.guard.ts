import { Injectable } from '@angular/core';
import { Router, CanActivate } from '@angular/router';

import { ComUserLoginService as UserLogin } from '../services/com-user-login.service';

@Injectable()
export class AuthGuard implements CanActivate {

    constructor(
        private _route: Router,
        private _userLogin: UserLogin
    ) {

    }

    canActivate() {
        let isLogged: boolean = this._userLogin.checkLogin();
        
        if (!isLogged) {
            this._route.navigate(['login']);
        }

        return isLogged;
    }

}