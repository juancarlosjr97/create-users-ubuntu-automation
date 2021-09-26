# Creating Users Ubuntu Script

This repository contains a script to create multiple users non-interactively using a CSV.

## Prerequisites

- [GIT](https://git-scm.com/)
- [Docker](https://www.docker.com/)

## Usage

1. Copy `create-users.sh` and `update-ssh.sh` to a running ubuntu server and make them executable by running. The scripts are available inside the `scripts` directory

```bash
chmod +x create-users.sh
chmod +x update-ssh.sh
```

2. Create a `users.csv` file following the template on the repository available inside the `data` directory

| username | password |
| -------- | -------- |
| juan     | juanpwd1 |
| juan2    | juanpwd2 |
| juan3    | juanpwd3 |

3. The `update-ssh.sh` will allow to `ssh` to the server with password

```bash
./path/to/update-ssh.sh
```

4. The `create-users.sh` will create the users with passwords, home directory and protect the access to those users to root directories and other user home directories

```bash
./path/to/create-users.sh
```

If everything was executed successfully, the script will finished by showing a message "All users were created successfully. Cool!"

## Local Automated Test

The `docker-compose.yml` creates an Ubuntu `18.04` container that will automatically create the users specified on the `users.csv` that is passed as a volume along with the `create-users.sh` during start-up of the container.

In order to start the container run:

```bash
docker-compose up
```

When the start-up has finished successfully a message will appear on the terminal "All users were created successfully. Cool!". After all the users have been created, a test will be executed to make sure all the passwords are set correctly of each user and if everything goes well it will show `User xyz has been set with the correct password` to every user.

### SSH with root

To ssh as `root` run:

```bash
ssh root@localhost -p 55008
```

The password of the `root` is `root`

### SSH with Non-root

To ssh with any of the non-root users created automatically run:

```bash
ssh juan@localhost -p 55008
```

The password of the `juan` is `juanpwd1`. Open the `users.csv` to see all the users and their passwords.
