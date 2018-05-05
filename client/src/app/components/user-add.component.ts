import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { environment } from '../../environments/environment';
import { HttpUserService } from '../services/http-user.service';
import { ValidationService } from '../services/validation.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-user-add',
    templateUrl: '../views/user-add.component.html'
})
export class UserAddComponent implements OnInit {

    public userAddForm: FormGroup;
    public roles: object = environment.userRoles;

    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _httpUserService: HttpUserService,
        private _formBuilder: FormBuilder,
        private _flash: Flash
    ) {

    }

    ngOnInit() {
        this.restartForm();
    }

    restartForm() {
        this.userAddForm = this._formBuilder.group({
            'email': ['', [Validators.required, ValidationService.email]],
            'password': ['', [Validators.required, Validators.minLength(6), Validators.maxLength(32)]],
            'password_confirm': ['', [Validators.required, Validators.minLength(6), Validators.maxLength(32), ValidationService.matchPassword]],
            'first_name': ['', [Validators.required]],
            'last_name': ['', [Validators.required]],
            'date_of_birth': ['', [Validators.required, ValidationService.date]],
            'avatar': ['', [ValidationService.image]],
            'gender': ["1", [Validators.required]],
            'role': [0],
            'note': ['']
        });
    }

    fileChangeEvent(fileInput: any) {
        this.userAddForm.controls['avatar'].markAsTouched();
        this.userAddForm.controls['avatar'].setValue(fileInput.target.files[0]);
    }

    createUser() {
        if (this.userAddForm.valid) {
            this._httpUserService.addNew(this.userAddForm.value).subscribe((response) => {
                if (response.status === environment.statusSuccess) {
                    this._flash.success('登録が成功しました。');
                    this._router.navigate(['/user']);
                } else {
                    if(response.errors) {
                        this._flash.error('登録が失敗されました。', response.errors);
                    }
                }
            }, (error) => {
                console.log(JSON.stringify(error));
            });
        }
    }
}