import { Injectable } from '@angular/core';
import { Subject } from 'rxjs/Subject';

@Injectable()
export class ComCategoryListService {

    public items: Array<object> = [];
    public paging: object = {};
    public sort: object = {};
    public params: object = {};
    public roles: object = { 2: '管理者', 1: '運営者', 0: '使用者' };
}