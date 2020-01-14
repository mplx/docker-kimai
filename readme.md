# Kimai on Docker

Alpine Linux based Docker container with NGINX webserver and [Kimai2 Time Tracker](https://github.com/kevinpapst/kimai2).

**WORK IN PROGRESS!**

## [Docker Hub](https://hub.docker.com/r/mplx/docker-kimai/) Version Tag

| Tag                                                                    | Description                                   |
| ---------------------------------------------------------------------- | --------------------------------------------- |
| [x.y.z](https://github.com/mplx/docker-kimai/blob/master/CHANGELOG.md) | images matching git tags; semantic versioning |
| latest                                                                 | build with latest semver tag                  |
| master                                                                 | build from latest commit in master branch     |

## Run

```bash
docker run --rm --name kimai -p 8080:8080 -v data:/home/project/kimai2/var/data/ --env-file kimai.env mplx/kimai
```

## Environment Variables

| Variable           | Description                                | [Sample](https://github.com/mplx/docker-kimai/blob/master/kimai.env) Value |
| ------------------ | ------------------------------------------ | ---------------------------------------------------- |
| DATABASE_URL       | Database connection URI                    | sqlite:///%kernel.project_dir%/var/data/kimai.sqlite |
| APP_SECRET         | Symfony application secret                 | changeme                                             |
| TRUSTED_PROXIES    | Kimai trusted proxies                      | false                                                |
| TRUSTED_HOSTS      | Kimai trusted hosts                        | false                                                |
| MAILER_FROM        | Mail-From                                  | invalid@example.org                                  |
| MAILER_URL         | Mail server URI                            | null://localhost                                     |
| INSTALL_ADMINUSER* | [Superadmin](https://www.kimai.org/documentation/users.html): username | superadmin               |
| INSTALL_ADMINPASS* | Superadmin: password                       | changeme                                             |
| INSTALL_ADMINMAIL* | Superadmin: email address                  | invalid@example.org                                  |
| INSTALL_PLUGIN_nnn | install plugin (see below)                 | true                                                 |
| ALLOW_USER_REG     | allow registration of new users            | false                                                |
| TZ                 | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | Atlantic/Canary       |

_(*) only valid on first run (fresh installation scenario)_

## Bundled Plugins

| Variable                                 | Plugin                                                                      |
| ---------------------------------------- | --------------------------------------------------------------------------- |
| INSTALL_PLUGIN_EASYBACKUPBUNDLE          | [EasyBackupBundle](https://github.com/mxgross/EasyBackupBundle)             |
| INSTALL_PLUGIN_CUSTOMCSSBUNDLE           | [CustomCSSBundle](https://github.com/Keleo/CustomCSSBundle)                 |
| INSTALL_PLUGIN_READONLYACCESSBUNDLE      | [ReadOnlyAccessBundle](https://github.com/fungus75/ReadOnlyAccessBundle)    |
| INSTALL_PLUGIN_RECALCULATERATESBUNDLE    | [RecalculateRatesBundle](https://github.com/Keleo/RecalculateRatesBundle)   |

- If you need to install other plugins than the ones bundled you'll need to map the `var/plugins/` outside the container (.ie. `-v plugins:/home/project/kimai2/var/plugins`).
- The plugin will only get installed/enabled if the plugin directory currently does not exist (i.e. you mapped the plugin directory outside the container and installed it yourself).
- An already installed plugin (i.e. you mapped the plugin directory) won't get removed if you set this option to `false`.

## Volumes

| Directory                                | Description                         |
| ---------------------------------------- | ----------------------------------- |
| /home/project/kimai2/var/data/           | Data(base)                          |
| /home/project/kimai2/var/log/            | Symfony prod.log                    |
| /home/project/kimai2/var/plugins/        | Kimai2 Plugins                      |
| /home/project/kimai2/var/easy_backup/    | Default EasyBackup Target Directory |

- Even if you don't use sqlite it's recommended to persist `.../var/data` as it might get usefull for further updates.
- You also can map the full `/home/project/kimai2/var/` however this would include the Symfony Cache, PHP Sessions, etc. aswell.

## Contributing Guidelines

Contributions welcome! When submitting your first pull request please add your _author email_ (the one you use to make commits) to the [contributors](CONTRIBUTORS) file which contains a Contributor License Agreement (CLA).

## License

Licensed under [MIT License](LICENSE).

