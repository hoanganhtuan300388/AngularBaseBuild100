import { Injectable } from '@angular/core';
import { Http, Response, URLSearchParams, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';

import { HttpAppService } from './http-app.service';

@Injectable()
export class HttpUserService {

    constructor(private _http: HttpAppService) {

    }

    public getList(params: object = {}): Observable<any> {
        return this._http.get('user/getList', params).map((response: Response) => response.json());
    }

    public getDetail(id: number): Observable<any> {
        return this._http.get('user/getDetail', { id: id }).map((response: Response) => response.json());
    }

    public addNew(data: object): Observable<any> {
        return this._http.post('user/addNew', data, null, true).map((response: Response) => response.json());
    }

    public updateDetail(data: object): Observable<any> {
        return this._http.put('user/updateDetail', data, null, true).map((response: Response) => response.json());
    }

    public login(data: object): Observable<any> {
        return this._http.post('user/login', data, null, true).map((response: Response) => response.json());
    }

    public delete(id: number): Observable<any> {
        return this._http.delete('user/delete', { id: id }).map((response: Response) => response.json());
    }
}