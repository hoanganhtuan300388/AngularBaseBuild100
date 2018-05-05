import { Injectable } from '@angular/core';
import { Http, RequestOptions, RequestOptionsArgs, Response, Request, Headers, XHRBackend, URLSearchParams } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';
import { environment } from '../../environments/environment';

@Injectable()
export class HttpAppService extends Http {

    public apiUrl: string = environment.apiLocaleURL;
    protected isError: boolean = false;
    protected showLoading: boolean = true;

    /**
     * 
     * @param backend 
     * @param defaultOptions 
     */
    constructor(
        public backend: XHRBackend,
        public defaultOptions: RequestOptions
    ) {
        super(backend, defaultOptions);
    }

    /**
     * 
     * @param url 
     * @param params 
     * @param options 
     */
    public get(url: string, params: any = {}, options?: RequestOptionsArgs): Observable<any> {
        this._showLoader();

        return super.get(this._getFullUrl(url), this._requestOptions(options, 'get', params))
            .catch(this._onCatch)
            .do((res: Response) => {
                this._onSuccess(res);
            }, (error: any) => {
                this._onError(error);
            })
            .finally(() => {
                this._onEnd();
            });
    }

    /**
     * 
     * @param url 
     * @param params 
     * @param options 
     * @param isFromData 
     */
    public post(url: string, params: any, options?: RequestOptionsArgs, isFromData: boolean = false): Observable<any> {
        this._showLoader();

        let request: any = null;

        if (isFromData === false) {
            request = this._getUrlSearchParams(params);
        } else {
            request = this._getFormData(params);
        }

        return super.post(this._getFullUrl(url), request, this._requestOptions(options, 'post'))
            .catch(this._onCatch)
            .do((res: Response) => {
                this._onSuccess(res);
            }, (error: any) => {
                this._onError(error);
            })
            .finally(() => {
                this._onEnd();
            });
    }

    /**
     * 
     * @param url 
     * @param params 
     * @param options 
     * @param isFromData 
     */
    public put(url: string, params: any, options?: RequestOptionsArgs, isFromData: boolean = false): Observable<any> {
        this._showLoader();

        let request: any = null;
        
        params['_method'] = 'PUT';

        if (isFromData === false) {
            request = this._getUrlSearchParams(params);
        } else {
            request = this._getFormData(params);
        }

        return super.post(this._getFullUrl(url), request, this._requestOptions(options, 'put'))
            .catch(this._onCatch)
            .do((res: Response) => {
                this._onSuccess(res);
            }, (error: any) => {
                this._onError(error);
            })
            .finally(() => {
                this._onEnd();
            });
    }

    /**
     * 
     * @param url 
     * @param params 
     * @param options 
     */
    public delete(url: string, params: any = {}, options?: RequestOptionsArgs): Observable<any> {
        this._showLoader();
        
        let request: URLSearchParams = null;

        params['_method'] = 'DELETE';

        request = this._getUrlSearchParams(params);

        return super.post(this._getFullUrl(url), request, this._requestOptions(options, 'delete'))
            .catch(this._onCatch)
            .do((res: Response) => {
                this._onSuccess(res);
            }, (error: any) => {
                this._onError(error);
            })
            .finally(() => {
                this._onEnd();
            });
    }

    /**
     * 
     * @param options 
     * @param type 
     * @param searchParams 
     */
    protected _requestOptions(options?: RequestOptionsArgs, type: string = 'get', searchParams: any = null): RequestOptionsArgs {
        if (options == null) {
            options = new RequestOptions();
        }

        if (options.headers == null) {
            options.headers = new Headers();
        }

        //options.headers.append('Content-Type', 'application/json');
        //options.headers.append('Authorization', 'Bearer ' + this._loginService.getLoginToken());
        //console.log(this._loginService.getLoginToken());

        if (type == 'get' && searchParams != null) {
            let urlSearchParams: URLSearchParams = new URLSearchParams();
            for (let key in searchParams) {
                urlSearchParams.append(key, searchParams[key]);
            }

            options.search = urlSearchParams;
        }

        return options;
    }

    /**
     * 
     * @param params 
     */
    protected _getUrlSearchParams(params: any): URLSearchParams {
        let urlSearchParams = new URLSearchParams();

        for (let key in params) {
            if (params[key] instanceof Array) {
                for (let value of params[key]) {
                    urlSearchParams.append(key + '[]', value);
                }
            } else {
                urlSearchParams.append(key, params[key]);
            }
        }

        return urlSearchParams;
    }

    /**
     * 
     * @param params 
     */
    protected _getFormData(params: any): FormData {
        let formData: FormData = new FormData();

        for (let key in params) {
            if (params[key] instanceof File) {
                formData.append(key, params[key], params[key].name);
            } else if (params[key] instanceof Array) {
                for (let value of params[key]) {
                    formData.append(key + '[]', value);
                }
            } else {
                formData.append(key, params[key]);
            }
        }

        return formData;
    }

    protected _getFullUrl(url: string): string {
        console.log(this.apiUrl + url);
        return this.apiUrl + url;
    }

    protected _onCatch(error: any, caught: Observable<any>): Observable<any> {
        return Observable.throw(error);
    }

    protected _onSuccess(response: Response): void {

    }

    protected _onError(response: Response): void {
        console.log(response)
    }

    protected _onEnd(): void {

    }

    protected _showLoader(): void {

    }

    protected _hideLoader(): void {

    }
}