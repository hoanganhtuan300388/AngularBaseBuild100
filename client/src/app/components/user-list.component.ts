import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';

import { environment } from '../../environments/environment';
import { HttpUserService } from '../services/http-user.service';
import { ComUserListService as UserList } from '../services/com-user-list.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-user-list',
    templateUrl: '../views/user-list.component.html'
})
export class UserListComponent implements OnInit {

    public userSearchForm: FormGroup;
    public roles: object = environment.userRoles;

    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _httpUserService: HttpUserService,
        private _flash: Flash,
        private _formBuilder: FormBuilder,
        public userList: UserList
    ) {

    }

    ngOnInit() {
        this.userList.params = {};
        this.loadData(this.userList.params);
        this.restartForm();
    }

    restartForm() {
        this.userSearchForm = this._formBuilder.group({
            'email': [''],
            'full_name': [''],
            'role': ['']
        });
    }


    loadData(params: any = {}) {
        this._httpUserService.getList(params).subscribe(
            (response) => {
                if (response.status === environment.statusSuccess) {
                    this.userList.items = response.data.items;
                    this.userList.paging = response.data.paging;
                    this.userList.sort = response.data.sort;
                } else {
                    console.log(response);
                }
            },
            (error) => {
                console.log(error);
            }
        );
    }

    changeLimit(limit: number) {
        this.userList.params['page'] = 1;
        this.userList.params['limit'] = limit;
        this.loadData(this.userList.params);
    }

    changePage(page: number) {
        this.userList.params['page'] = page;
        this.loadData(this.userList.params);
    }

    searchUser() {
        this.userList.params['page'] = 1;
        this.userList.params['email'] = this.userSearchForm.value.email;
        this.userList.params['role'] = this.userSearchForm.value.role;
        this.userList.params['full_name'] = this.userSearchForm.value.full_name;
        this.loadData(this.userList.params);
    }

    deleteUser(id: number) {
        if (confirm('確かに削除データですか？')) {
            this._httpUserService.delete(id).subscribe(
                (response) => {
                    if (response.status === environment.statusSuccess) {
                        this._flash.success('削除が成功しました。');
                        this.userList.params = {};
                        this.loadData(this.userList.params);
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
        }
    }
}