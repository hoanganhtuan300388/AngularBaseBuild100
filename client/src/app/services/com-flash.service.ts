import { Injectable } from '@angular/core';
import { Subject } from 'rxjs/Subject';

@Injectable()
export class ComFlashService {

    public message: string = '';
    public errors: any = null;
    public display: boolean = false;
    public afterInit: boolean = false;
    public wrapClassName: string = '';
    public iconClassName: string = '';

    public error(errorMessage: string = '', errors: any = null) {
        this.message = errorMessage;
        this.errors = errors;
        this.display = true;
        this.afterInit = true;
        this.wrapClassName = 'alert-warning';
        this.iconClassName = 'fa-warning';
    }

    public success(successMessage: string = '') {
        this.message = successMessage;
        this.errors = null;
        this.display = true;
        this.afterInit = true;
        this.wrapClassName = 'alert-success';
        this.iconClassName = 'fa-check';
    }

    public close() {
        this.message = '';
        this.errors = [];
        this.display = false;
        this.afterInit = false;
        this.wrapClassName = '';
        this.iconClassName = '';
    }

}