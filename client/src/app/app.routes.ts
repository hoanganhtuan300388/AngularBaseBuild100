import { Routes, RouterModule } from '@angular/router';

import { LayoutLoginComponent } from './components/layout-login.component';
import { LoginComponent } from './components/login.component';
import { LayoutMainComponent } from './components/layout-main.component';
import { ErrorComponent } from './components/error.component';
import { HomeComponent } from './components/home.component';
import { UserListComponent } from './components/user-list.component';
import { UserAddComponent } from './components/user-add.component';
import { UserEditComponent } from './components/user-edit.component';
import { UserProfileComponent } from './components/user-profile.component';
import { CategoryListComponent } from './components/category-list.component';
import { CategoryAddComponent } from './components/category-add.component';
import { CategoryEditComponent } from './components/category-edit.component';

import { AuthGuard } from './guards/auth.guard';

const routing: Routes = [
    {
        path: 'login',
        component: LayoutLoginComponent,
        children: [
            {
                path: '',
                component: LoginComponent,
                data: { title: 'ログイン' }
            }
        ]
    },
    {
        path: '',
        component: LayoutMainComponent,
        //canActivate: [AuthGuard],
        children: [
            {
                path: '',
                redirectTo: 'home',
                pathMatch: 'full'
            },
            {
                path: 'home',
                component: HomeComponent,
                data: { title: '計器盤', desc: '' }
            },
            {
                path: 'user',
                component: UserListComponent,
                data: { title: '管理者一覧', desc: '' }
            },
            {
                path: 'user/index',
                component: UserListComponent,
                data: { title: '管理者一覧', desc: '' }
            },
            {
                path: 'user/add',
                component: UserAddComponent,
                data: { title: '管理者登録', desc: '' }
            },
            {
                path: 'user/edit/:id',
                component: UserEditComponent,
                data: { title: '管理者詳細情報', desc: '' }
            },
            {
                path: 'user/profile',
                component: UserProfileComponent,
                data: { title: '管理者プロフィール', desc: '' }
            },
            {
                path: 'category',
                component: CategoryListComponent,
                data: { title: 'カテゴリー一覧', desc: '' }
            },
            {
                path: 'category/index',
                component: CategoryListComponent,
                data: { title: 'カテゴリー一覧', desc: '' }
            },
            {
                path: 'category/add',
                component: CategoryAddComponent,
                data: { title: 'カテゴリー登録', desc: '' }
            },
            {
                path: 'category/edit/:id',
                component: CategoryEditComponent,
                data: { title: 'カテゴリー詳細情報', desc: '' }
            },
            {
                path: '**',
                component: ErrorComponent,
                data: { title: '404 Error Page', desc: '' }
            }
        ]
    }
];

export const AppRoutes = RouterModule.forRoot(routing);