import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Subscription } from 'rxjs/Subscription';

import { environment } from '../../environments/environment';
import { HttpUserService } from '../services/http-user.service';
import { ValidationService } from '../services/validation.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-user-edit',
    templateUrl: '../views/user-edit.component.html'
})
export class UserEditComponent implements OnInit, OnDestroy {

    public userUpdateForm: FormGroup;
    public roles: object = environment.userRoles;
    private _subscription: Subscription;

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

    ngOnDestroy() {
        this._subscription.unsubscribe();
    }

    restartForm() {
        this.userUpdateForm = this._formBuilder.group({
            'id': [''],
            'email': ['', [Validators.required, ValidationService.email]],
            'password': ['', [Validators.minLength(6), Validators.maxLength(32)]],
            'password_confirm': ['', [Validators.minLength(6), Validators.maxLength(32), ValidationService.matchPassword]],
            'first_name': ['', [Validators.required]],
            'last_name': ['', [Validators.required]],
            'date_of_birth': ['', [Validators.required, ValidationService.date]],
            'avatar': ['', [ValidationService.image]],
            'gender': ["1", [Validators.required]],
            'role': [0],
            'note': [''],
            'created': [''],
            'updated': ['']
        });

        this._subscription = this._activatedRoute.params.subscribe((params) => {
            if (params['id']) {
                this.loadUserById(params['id']);
            }
        });
    }

    loadUserById(id: number) {
        this._httpUserService.getDetail(id).subscribe((response) => {
            if (response.status === environment.statusSuccess) {
                let user: object = response.data;

                this.userUpdateForm.patchValue({
                    'id': user['id'],
                    'email': user['email'],
                    'first_name': user['first_name'],
                    'last_name': user['last_name'],
                    'date_of_birth': user['date_of_birth'],
                    'gender': user['gender'],
                    'role': user['role'],
                    'note': user['note'],
                    'created': user['created'],
                    'updated': user['updated']
                });
            } else {
                this._flash.error('レコードが見つかりません。');
                this._router.navigate(['/user']);
            }
        }, (error) => {
            console.log(JSON.stringify(error));
        });
    }

    fileChangeEvent(fileInput: any) {
        this.userUpdateForm.controls['avatar'].markAsTouched();
        this.userUpdateForm.controls['avatar'].setValue(fileInput.target.files[0]);
    }

    updateUser() {
        if (this.userUpdateForm.valid) {
            let data: object = {
                'id': this.userUpdateForm.value['id'],
                'email': this.userUpdateForm.value['email'],
                'first_name': this.userUpdateForm.value['first_name'],
                'last_name': this.userUpdateForm.value['last_name'],
                'date_of_birth': this.userUpdateForm.value['date_of_birth'],
                'avatar': this.userUpdateForm.value['avatar'],
                'gender': this.userUpdateForm.value['gender'],
                'role': this.userUpdateForm.value['role'],
                'note': this.userUpdateForm.value['note']
            };

            this._httpUserService.updateDetail(data).subscribe((response) => {
                if (response.status === environment.statusSuccess) {
                    this._flash.success('更新が成功しました。');
                    this._router.navigate(['/user']);
                } else {
                    if (response.errors) {
                        this._flash.error('更新が失敗されました。', response.errors);
                    }
                }
            }, (error) => {
                console.log(JSON.stringify(error));
            });
        }
    }
}