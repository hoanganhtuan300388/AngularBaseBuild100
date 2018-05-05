import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { environment } from '../../environments/environment';
import { HttpCategoryService } from '../services/http-category.service';
import { ValidationService } from '../services/validation.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-category-add',
    templateUrl: '../views/category-add.component.html'
})
export class CategoryAddComponent {

    public categoryAddForm: FormGroup;
    public parents: any = [];

    constructor(
        private _router: Router,
        private _activatedRoute: ActivatedRoute,
        private _httpCategoryService: HttpCategoryService,
        private _formBuilder: FormBuilder,
        private _flash: Flash
    ) {

    }

    ngOnInit() {
        this.restartForm();
    }

    restartForm() {
        this.categoryAddForm = this._formBuilder.group({
            'name': ['', [Validators.required]],
            'slug': [''],
            'parent_id': [''],
            'description': ['']
        });

        this.loadParents();
    }

    loadParents() {
        this._httpCategoryService.getComboList().subscribe((response) => {
                if (response.status === environment.statusSuccess) {
                    this.parents = response.data;
                } else {
                    console.log(response);
                }
            }, (error) => {
                console.log(JSON.stringify(error));
            });
    }

    createCategory() {
        if (this.categoryAddForm.valid) {
            this._httpCategoryService.addNew(this.categoryAddForm.value).subscribe((response) => {
                if (response.status === environment.statusSuccess) {
                    this._flash.success('登録が成功しました。');
                    this._router.navigate(['/category']);
                } else {
                    if (response.errors) {
                        this._flash.error('登録が失敗されました。', response.errors);
                    }
                }
            }, (error) => {
                console.log(JSON.stringify(error));
            });
        }
    }

}