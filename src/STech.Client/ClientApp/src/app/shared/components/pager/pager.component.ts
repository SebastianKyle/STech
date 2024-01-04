import {Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges} from '@angular/core';
import {filter} from "rxjs";

@Component({
  selector: 'app-pager',
  templateUrl: './pager.component.html',
  styleUrls: ['./pager.component.css']
})
export class PagerComponent implements OnInit, OnChanges {
  @Input() totalCount: number;
  @Input() pageSize: number;
  @Input() pageIndex: number;
  @Output() pageChanged = new EventEmitter<number>();
  numPages: number;
  pages: number[] = [];
  maxPages: number = 10;
  startPage: number;
  endPage: number;

  constructor() {

  }

  ngOnInit(): void {
    this.countPages();
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes.totalCount || changes.pageSize) {
      this.pageIndex = 1;
      this.countPages();
    }
  }

  onPagerChange(pageIndex: number) {
    this.pageIndex = pageIndex;
    this.pageChanged.emit(pageIndex);

    if (this.numPages > this.maxPages) {
      this.setPageRange();
    }
  }

  countPages() {
    this.numPages = Math.ceil(this.totalCount / this.pageSize);

    this.pages = [];
    for (let i = 1; i <= this.numPages; i++) {
      this.pages.push(i);
    }

    if (this.numPages > this.maxPages) {
      this.setPageRange();
    }
    else {
      this.startPage = 1;
      this.endPage = this.numPages;
    }
  }

  setPageRange() {
    let maxPagesBeforeCurPage = Math.floor(this.maxPages / 2);
    let maxPagesAfterCurPage = Math.ceil(this.maxPages / 2) - 1;

    if (this.pageIndex <= maxPagesBeforeCurPage) {
      this.startPage = 1;
      this.endPage = this.maxPages;
    }
    else if (this.pageIndex + maxPagesAfterCurPage >= this.numPages) {
      this.startPage = this.numPages - this.maxPages + 1;
      this.endPage = this.numPages;
    }
    else {
      this.startPage = this.pageIndex - maxPagesBeforeCurPage;
      this.endPage = this.pageIndex + maxPagesAfterCurPage;
    }
  }

  get filterPages() {
    return this.pages.filter(p => p >= this.startPage && p <= this.endPage);
  }

}
