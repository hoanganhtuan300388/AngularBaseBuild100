import { Component, OnInit, OnChanges, Input, Output, EventEmitter } from '@angular/core';

import { environment } from '../../environments/environment';

@Component({
    selector: 'app-element-paginator',
    templateUrl: '../views/element-paginator.component.html'
})
export class ElementPaginatorComponent implements OnInit, OnChanges {

    @Input('paging') paging;

    @Output() onChangePage = new EventEmitter<number>();

    public pages = [];

    constructor() {

    }

    ngOnInit() {

    }

    ngOnChanges() {
        this.pages = [];

        let maxDisplayPage: number = environment.maxDisplayPage;
        let from: number = 1;
        let to: number = this.paging.pageCount;

        if (this.paging.pageCount > maxDisplayPage) {
            let ceil = Math.ceil(maxDisplayPage / 2);
            let floo = Math.floor(maxDisplayPage / 2);

            if (this.paging.page > ceil) {
                if (this.paging.page >= (this.paging.pageCount - floo)) {
                    from = this.paging.pageCount - maxDisplayPage + 1;
                    to = this.paging.pageCount;
                } else {
                    from = this.paging.page - floo;
                    to = this.paging.page + floo;
                }
            } else {
                from = 1;
                to = maxDisplayPage;
            }
        }
        
        let items = [];

        for(let i = from; i <= to; i++) {
            this.pages.push(i);
        }

        //this.pages = Array(this.paging.pageCount).fill(0).map((x, i) => i + 1);
    }

    changePage(page: number) {
        this.onChangePage.emit(page);
    }
}