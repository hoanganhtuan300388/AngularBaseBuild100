import { Injectable } from '@angular/core';
import { Http, Response, URLSearchParams, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';

import { HttpAppService } from './http-app.service';

@Injectable()
export class HttpCategoryService {

    constructor(private _http: HttpAppService) {

    }

    public getList(params: object = {}): Observable<any> {
        return this._http.get('category/getList', params).map((response: Response) => response.json());
    }

    public getComboList(): Observable<any> {
        return this._http.get('category/getComboList').map((response: Response) => response.json());
    }

    public getDetail(id: number): Observable<any> {
        return this._http.get('category/getDetail', { id: id }).map((response: Response) => response.json());
    }

    public addNew(data: object): Observable<any> {
        return this._http.post('category/addNew', data, null).map((response: Response) => response.json());
    }

    public updateDetail(data: object): Observable<any> {
        return this._http.put('category/updateDetail', data, null).map((response: Response) => response.json());
    }

    public delete(id: number): Observable<any> {
        return this._http.delete('category/delete', { id: id }).map((response: Response) => response.json());
    }
}