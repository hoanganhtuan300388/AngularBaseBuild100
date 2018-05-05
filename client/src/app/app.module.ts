import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { AppRoutes } from './app.routes';

//begin components
import { LayoutLoginComponent } from './components/layout-login.component';
import { LoginComponent } from './components/login.component';

import { LayoutMainComponent } from './components/layout-main.component';
import { ControlMessageComponent } from './components/control-message.component';
import { ElementHeaderComponent } from './components/element-header.component';
import { ElementSidebarComponent } from './components/element-sidebar.component';
import { ElementContentHeaderComponent } from './components/element-content-header.component';
import { ElementFooterComponent } from './components/element-footer.component';
import { ElementFlashComponent } from './components/element-flash.component';
import { ElementPaginatorComponent } from './components/element-paginator.component';
import { ElementLimitComponent } from './components/element-limit.component';
import { ErrorComponent } from './components/error.component';
import { HomeComponent } from './components/home.component';
import { UserListComponent } from './components/user-list.component';
import { UserAddComponent } from './components/user-add.component';
import { UserEditComponent } from './components/user-edit.component';
import { UserProfileComponent } from './components/user-profile.component';
import { CategoryListComponent } from './components/category-list.component';
import { CategoryAddComponent } from './components/category-add.component';
import { CategoryEditComponent } from './components/category-edit.component';
//end components

//begin http services
import { HttpAppService } from './services/http-app.service';
import { HttpUserService } from './services/http-user.service';
import { HttpCategoryService } from './services/http-category.service';
//end http services

//begin com service
import { ComContentHeaderService } from './services/com-content-header.service';
import { ComFlashService } from './services/com-flash.service';
import { ComUserLoginService } from './services/com-user-login.service';
import { ComUserListService } from './services/com-user-list.service';
import { ComCategoryListService } from './services/com-category-list.service';
//end com service

//begin pipes
import { KeysPipe } from './pipes/keys.pipe';
//end pipes

//begin guards
import { AuthGuard } from './guards/auth.guard';
//end guards

@NgModule({
  declarations: [
    AppComponent,
    LayoutLoginComponent,
    LoginComponent,
    LayoutMainComponent,
    ControlMessageComponent,
    ElementHeaderComponent,
    ElementSidebarComponent,
    ElementContentHeaderComponent,
    ElementFooterComponent,
    ElementFlashComponent,
    ElementPaginatorComponent,
    ElementLimitComponent,
    ErrorComponent,
    HomeComponent,
    UserListComponent,
    UserAddComponent,
    UserEditComponent,
    UserProfileComponent,
    CategoryListComponent,
    CategoryAddComponent,
    CategoryEditComponent,
    KeysPipe
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    ReactiveFormsModule,
    HttpModule,
    AppRoutes
  ],
  providers: [
    HttpAppService,
    HttpUserService,
    HttpCategoryService,
    ComContentHeaderService,
    ComFlashService,
    ComUserLoginService,
    ComUserListService,
    ComCategoryListService,
    AuthGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
