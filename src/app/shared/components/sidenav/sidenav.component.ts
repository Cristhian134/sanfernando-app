import { Component, HostListener, Output } from '@angular/core';
import data from '../../constants/navbar-options'
import { EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { BehaviorSubject } from 'rxjs';

interface SideNavToggle {
  screenWidth: number;
  collapsed: boolean;
}

@Component({
  selector: 'app-sidenav',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
  ],
  templateUrl: './sidenav.component.html',
  styleUrl: './sidenav.component.scss'
})
export class SidenavComponent {

  @Output() onToggleSidenav: EventEmitter<SideNavToggle> = new EventEmitter();
  collapsed = false;
  screenWidth = 0;
  navData = data;

  // private _sidenavObservable: BehaviorSubject<SideNavToggle> = new BehaviorSubject<
  //   SideNavToggle
  // >({ screenWidth: this.screenWidth, collapsed: this.collapsed });

  // constructor() {
  //   this._sidenavObservable = new BehaviorSubject({ screenWidth: this.screenWidth, collapsed: this.collapsed })
  // }

  // @HostListener('window:resize', ['$event'])
  // onResize(event: any) {
  //   this.screenWidth = window.innerWidth;
  //   if (this.screenWidth <= 768) {
  //     this.collapsed = false
  //     this.onToggleSidenav.emit({ collapsed: this.collapsed, screenWidth: this.screenWidth });
  //   }
  // }

  ngOnInit(): void {
    this.screenWidth = window.innerWidth;
  }

  toggleCollapse(): void {
    this.collapsed = !this.collapsed;
    this.onToggleSidenav.emit({ collapsed: this.collapsed, screenWidth: this.screenWidth });
    // this._sidenavObservable.next({ collapsed: this.collapsed, screenWidth: this.screenWidth });
  }
  closeSidenav(): void {
    this.collapsed = true;
    this.onToggleSidenav.emit({ collapsed: this.collapsed, screenWidth: this.screenWidth });
    // this._sidenavObservable.next({ collapsed: this.collapsed, screenWidth: this.screenWidth });
  }

  // get sidenavToggle() {
  //   return this._sidenavObservable.asObservable();
  // }

}
