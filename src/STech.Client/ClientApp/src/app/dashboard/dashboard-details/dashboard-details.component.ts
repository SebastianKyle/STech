import {AfterViewChecked, AfterViewInit, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {AccountService} from "../../account/account.service";
import {IUser} from "../../shared/models/user";
import {Observable, ReplaySubject} from "rxjs";
import {DashboardService} from "../dashboard.service";
import {IYearlyProfit} from "../../shared/models/profit";
import {Chart, registerables} from "chart.js";

Chart.register(...registerables);

declare var $: any;

@Component({
  selector: 'app-dashboard-details',
  templateUrl: './dashboard-details.component.html',
  styleUrls: ['./dashboard-details.component.css']
})
export class DashboardDetailsComponent implements OnInit, AfterViewInit, AfterViewChecked {
  @ViewChild('barChart') private chartRef: ElementRef;
  @ViewChild('yearSelect') private yearSelect: ElementRef;
  chart: any;
  currentUser$: Observable<IUser>;
  yearlyProfits: IYearlyProfit[];
  currentDate = new Date();
  currentYearProfit = this.currentDate.getFullYear();
  totalProductsCount: number;
  totalCategoriesCount: number;
  totalOrdersCount: number;
  totalCommentsCount: number;
  totalUsersCount: number;

  constructor(private accountService: AccountService, private dashboardService: DashboardService) {}

  ngOnInit(): void {
    this.currentUser$ = this.accountService.currentUser$;
    this.getYearlyProfit();
    this.getTotalProductsCount();
    this.getTotalCategoriesCount();
    this.getTotalOrdersCount();
    this.getTotalCommentsCount();
    this.getTotalUsersCount();

    window.addEventListener('resize', () => {
      this.chart.resize();
    });
  }

  ngAfterViewInit(): void {
  }

  ngAfterViewChecked(): void {
    $(this.yearSelect?.nativeElement).niceSelect();
    $(this.yearSelect?.nativeElement).on('change', () => {
      this.currentYearProfit = +this.yearSelect.nativeElement.value;
      console.log(this.currentYearProfit);
      this.createChart();
    });
  }

  getYearlyProfit() {
    this.dashboardService.getYearlyProfit().subscribe(profits => {
      this.yearlyProfits = profits;
      this.createChart();
    }, error => {
      console.log(error);
    });
  }

  createChart() {
    const record = this.yearlyProfits.find(y => y.year === this.currentYearProfit);
    const data = record?.monthlyProfits.map(monthlyProfit => monthlyProfit.profit);

    if (this.chart) {
      this.chart.destroy();
    }

    this.chart = new Chart(this.chartRef.nativeElement, {
      type: 'bar',
      data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'November', 'October', 'December'],
        datasets: [{
          label: 'Monthly Profit',
          data: data,
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
            title: {
              text: 'Profit (in USD)',
              display: true
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: this.currentYearProfit.toString() + ' Profit',
            font: {
              size: 30
            }
          }
        }
      }
    });
  }

  getTotalProductsCount() {
    this.dashboardService.getProductsCount().subscribe(count => {
      this.totalProductsCount = count;
    }, error => {
      console.log(error);
    });
  }

  getTotalCategoriesCount() {
    this.dashboardService.getCategoriesCount().subscribe(count => {
      this.totalCategoriesCount = count;
    }, error => {
      console.log(error);
    });
  }

  getTotalOrdersCount() {
    this.dashboardService.getOrdersCount().subscribe(count => {
      this.totalOrdersCount = count;
    }, error => {
      console.log(error);
    });
  }

  getTotalCommentsCount() {
    this.dashboardService.getCommentsCount().subscribe(count => {
      this.totalCommentsCount = count;
    }, error => {
      console.log(error);
    });
  }

  getTotalUsersCount() {
    this.dashboardService.getUsersCount().subscribe(count => {
      this.totalUsersCount = count;
    }, error => {
      console.log(error);
    });
  }

}
