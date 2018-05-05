import { Injectable } from '@angular/core';
import { Subject } from 'rxjs/Subject';

@Injectable()
export class ComContentHeaderService {

    public title: string = '';
    public desc: string = '';

}