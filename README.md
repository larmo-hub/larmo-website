# Larmo github page

## Development

### Dependencies

#### Ruby packages
First, we need the packages `ruby` and `ruby-sass`.

```
sudo apt-get install ruby ruby-sass
```

#### Node packages
Now, we need the package `nodejs`

```
sudo apt-get install nodejs
```

#### Npm and Bower dependencies
Once we have installed `ruby`, `ruby-sass`, and `nodejs` in our system, we need to get the required dependencies for development.

Just run this commands

```
npm install
./node_modules/.bin/bower install
```

### Making changes in the sass file
If we want to make changes in the sass file located in `resources/sass/styles.scss`, we need to tell gulp to watch our changes.

You can do that running this command

```
./node_modules/.bin/gulp watch
```
