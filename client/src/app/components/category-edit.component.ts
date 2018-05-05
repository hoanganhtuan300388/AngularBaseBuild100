import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Subscription } from 'rxjs/Subscription';

import { environment } from '../../environments/environment';
import { HttpCategoryService } from '../services/http-category.service';
import { ValidationService } from '../services/validation.service';
import { ComFlashService as Flash } from '../services/com-flash.service';

@Component({
    selector: 'app-category-edit',
    templateUrl: '../views/category-edit.component.html'
})
export class CategoryEditComponent implements OnInit, OnDestroy {

    public categoryUpdateForm: FormGroup;
    public parents: any = [];
    private _subscription: Subscription;

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

    ngOnDestroy() {
        this._subscription.unsubscribe();
    }

    restartForm() {
        this.categoryUpdateForm = this._formBuilder.group({
            'id': [''],
            'name': ['', [Validators.required]],
            'slug': [''],
            'parent_id': [''],
            'description': [''],
            'created': [''],
            'updated': ['']
        });

        this._subscription = this._activatedRoute.params.subscribe((params) => {
            if (params['id']) {
                this.loadParents();
                this.loadCategoryById(params['id']);
            }
        });
    }

    loadCategoryById(id: number) {
        this._httpCategoryService.getDetail(id).subscribe((response) => {
            if (response.status === environment.statusSuccess) {
                let category: object = response.data;

                this.categoryUpdateForm.patchValue({
                    'id': category['id'],
                    'name': category['name'],
                    'slug': category['slug'],
                    'parent_id': category['parent_id'],
                    'description': category['description'],
                    'created': category['created'],
                    'updated': category['updated']
                });
            } else {
                this._flash.error('レコードが見つかりません。');
                this._router.navigate(['/category']);
            }
        }, (error) => {
            console.log(JSON.stringify(error));
        });
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

    updateCategory() {
        if (this.categoryUpdateForm.valid) {
            let data: object = {
                'id': this.categoryUpdateForm.value['id'],
                'name': this.categoryUpdateForm.value['name'],
                'slug': this.categoryUpdateForm.value['slug'],
                'parent_id': this.categoryUpdateForm.value['parent_id'],
                'description': this.categoryUpdateForm.value['description']
            };
            
            this._httpCategoryService.updateDetail(data).subscribe((response) => {
                if (response.status === environment.statusSuccess) {
                    this._flash.success('更新が成功しました。');
                    this._router.navigate(['/category']);
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