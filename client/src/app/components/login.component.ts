import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { environment } from '../../environments/environment';
import { HttpUserService } from '../services/http-user.service';
import { ValidationService } from '../services/validation.service';
import { ComUserLoginService as UserLogin } from '../services/com-user-login.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-login',
    templateUrl: '../views/login.component.html'
})
export class LoginComponent {
    
    public userLoginForm: FormGroup;

    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _httpUserService: HttpUserService,
        private _formBuilder: FormBuilder,
        private _userLogin: UserLogin,
        private _flash: Flash
    ) {
        
    }

    ngOnInit() {
        this.restartForm();
    }

    restartForm() {
        this.userLoginForm = this._formBuilder.group({
            'email': ['', [Validators.required, ValidationService.email]],
            'password': ['', [Validators.required]]
        });
    }

    login() {
        if (this.userLoginForm.valid) {
            this._httpUserService.login(this.userLoginForm.value).subscribe((response) => {
                if (response.status === environment.statusSuccess) {
                    this._userLogin.login(response.data);
                    this._router.navigate(['/home']);
                } else {
                    alert(response.message);
                }
            }, (error) => {
                console.log(JSON.stringify(error));
            });
        }
    }
    
}