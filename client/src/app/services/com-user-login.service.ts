import { Injectable } from '@angular/core';
import { Subject } from 'rxjs/Subject';

@Injectable()
export class ComUserLoginService {
    
    public userLogged: object = {};

    checkLogin() {
        if(Object.keys(this.userLogged).length !== 0) {
            return true;
        }

        return false
    }

    login(user: object) {
        this.userLogged = user;
    }

    logout() {
        this.userLogged = {};
    }

}