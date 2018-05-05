import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';

import { environment } from '../../environments/environment';
import { HttpCategoryService } from '../services/http-category.service';
import { ComCategoryListService as CategoryList } from '../services/com-category-list.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-category-list',
    templateUrl: '../views/category-list.component.html'
})
export class CategoryListComponent {

    public userSearchForm: FormGroup;
    public parents: any;

    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _httpCategoryService: HttpCategoryService,
        private _flash: Flash,
        private _formBuilder: FormBuilder,
        public categoryList: CategoryList
    ) {

    }

    ngOnInit() {
        this.categoryList.params = {};
        this.loadData(this.categoryList.params);
        this.restartForm();
    }

    restartForm() {
        this.userSearchForm = this._formBuilder.group({
            'name': ['']
        });
    }


    loadData(params: any = {}) {
        this._httpCategoryService.getList(params).subscribe(
            (response) => {
                if (response.status === environment.statusSuccess) {
                    this.categoryList.items = response.data.items;
                    this.categoryList.paging = response.data.paging;
                    this.categoryList.sort = response.data.sort;
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
        this.categoryList.params['page'] = 1;
        this.categoryList.params['limit'] = limit;
        this.loadData(this.categoryList.params);
    }

    changePage(page: number) {
        this.categoryList.params['page'] = page;
        this.loadData(this.categoryList.params);
    }

    searchUser() {
        this.categoryList.params['page'] = 1;
        this.categoryList.params['name'] = this.userSearchForm.value.name;
        this.loadData(this.categoryList.params);
    }

    deleteUser(id: number) {
        if (confirm('確かに削除データですか？')) {
            this._httpCategoryService.delete(id).subscribe(
                (response) => {
                    if (response.status === environment.statusSuccess) {
                        this._flash.success('削除が成功しました。');
                        this.categoryList.params = {};
                        this.loadData(this.categoryList.params);
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
        }
    }

}