// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.

export const environment = {
  production: false,
  apiLocaleURL: 'http://localhost:8080/AngularBaseBuild/1.0.0/server/api/',
  apiServTestURL: 'http://localhost:8080/AngularBaseBuild/1.0.0/server/api/',
  apiReleaseURL: 'http://localhost:8080/AngularBaseBuild/1.0.0/server/api/',
  statusSuccess: 1,
  userRoles: { 2: '管理者', 1: '運営者', 0: '使用者' },
  maxDisplayPage: 7
};
