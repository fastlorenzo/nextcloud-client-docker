# Nextcloud docker-client

This image provides you an alpine based image for syncing your files with a remote [NextCloud server](https://nextcloud.com/).

It supports the following architectures: i386, amd64, armv7, arm64.

This image is based on the work made by the previous authors:

-   [Martin Peters](https://github.com/FreakyBytes)
-   [Juan Ignacio Borda](https://github.com/juanitomint)

## Example using local folder

```bash
docker run -it --rm \
  -v $(pwd)/sync-folder:/media/nextcloud \
  -e NC_USER=$username -e NC_PASS=$password \
  -e NC_URL=$server_url \
  fastlorenzo/nextcloud-client
```

## Example using local folder and exclude settings

You have to place a `exclude` file and a `unsyncfolders` file into one directory and mount it into the docker container.

```bash
docker run -it --rm \
  -v $(pwd)/sync-folder:/media/nextcloud \
  -v /path/to/settingsfolder:/settings \
  -e NC_USER=$username -e NC_PASS=$password \
  -e NC_URL=$server_url\
  fastlorenzo/nextcloud-client
```

## Example for the file "exclude" in the settings folder

```text
file1
file2
```

## Example for the file "unsyncfolders" in the settings folder

```text
folder1
folder2
```

## Example using a [named volume](https://docs.docker.com/storage/volumes/)

```bash
docker run -it --rm \
  -v some_named_volume:/media/nextcloud \
  -e NC_USER=$username -e NC_PASS=$password \
  -e NC_URL=$server_url\
  fastlorenzo/nextcloud-client
```

## Example one time run

```bash
docker run -it --rm \
  -v some_named_volume:/media/nextcloud \
  -e NC_USER=$username -e NC_PASS=$password \
  -e NC_URL=$server_url\
  -e NC_EXIT=true\
  fastlorenzo/nextcloud-client
```

replace:

-   $username
-   $password
-   $server_url

    with valid values for an existing and valid user on a Nextcloud Server.

## Environment variables

| Variable      | Description                                                                                                                        | Default value       |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| NC_USER       | The user name to use for authentication                                                                                            | `username`          |
| NC_PASS       | Valid password for the user above in clear text                                                                                    | `password`          |
| NC_SOURCE_DIR | The directory inside de docker container to be synced, usually you will have a local mount here or a named volume                  | `/media/nextcloud/` |
| NC_SILENT     | Whether or not output activity to console                                                                                          | `false`             |
| NC_INTERVAL   | Sets the interval between syncs in seconds                                                                                         | `300` (5 minutes)   |
| NC_EXIT       | If "true" the sync will happen once and then the container will exit, very useful for using in conjunction with cron or schedulers | `false`             |
| USER          | The system user inside the container you want to use for running the sync                                                          | `ncsync`            |
| PGID          | The system user group id inside the container you want to use for running the sync                                                 | `911`               |
| PUID          | The system user id inside the container you want to use for running the sync                                                       | `911`               |
| NC_TRUST_CERT | Whether or not trust self signed certificates or invalid certificates                                                              | `false`             |
| NC_HIDDEN     | Whether or not NextCloud should be forced to sync hidden files                                                                     | `false`             |

Any comment or problem feel free to [fill an issue](https://github.com/fastlorenzo/nextcloud-client-docker/issues/new) or make a PR!
