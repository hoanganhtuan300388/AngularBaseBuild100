import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
    selector: 'app-element-limit',
    templateUrl: '../views/element-limit.component.html'
})
export class ElementLimitComponent {

    @Input('limit') limit;

    @Output() onChangeLimit = new EventEmitter<number>();

    public limits: Array<number> = [5, 10, 15, 20, 30, 50];

    constructor() {

    }

    changeLimit(limit: number) {
        this.onChangeLimit.emit(limit);
    }

}