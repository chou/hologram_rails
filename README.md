#hologram_rails
<br>A gem to quickly get off the ground using Trulia's [Hologram](https://github.com/trulia/hologram) with a Rails project.  

##Installation
```ruby
./Gemfile  

gem 'hologram_rails'
gem 'hologram', github: 'trulia/hologram'
```
(At the time of writing, *it's necessary to specify the trulia/hologram github repo* because it's ahead of the published gem and allows using categories in \_header.html)  
<br>
`bundle && rails g hologram_rails:install && bundle exec guard`  
<br>
Edit `./doc_assets/_header.html` as needed! This is where all the styleguide-specific html and css is placed. You can extract the styles to assets compiled in the asset pipeline and just link to the stylesheets if you want. See [this post](http://pivotallabs.com/using-hologram-rails-auto-generate-styleguides/) for details on that approach.  

## What it Does
### [Hologram](https://github.com/trulia/hologram) Setup  
+ Parses all asset files in ./app/assets.
+ Outputs to ./public/styleguide
+ Hologram compilation assets are in ./doc_assets
+ Indexes to basics category
+ These configuration options can be changed by editing `./hologram_config.yml`

###[guard-hologram](https://github.com/kmayer/guard-hologram) Setup
+ Watches everything in ./doc_assets and all assets in ./app/assets; runs `hologram` upon change.
+ Settings editable in ./Guardfile

###Hologram
Hologram parses your assets (sass, less, css, md, styl, js) for comments of the following format and generates an .html file for each category of component using the _header.html and _footer.html partials Hologram provides.

    /*doc
    ---
    title: Alert
    name: alert
    category: alerts
    ---
    ```html_example
        <div class='alert'>Hello</div>
    ```
    */
    
    .alert{
      color: blue;
    }

From the comments above, Hologram will create a file called alerts.html that has one component, .alert, and inserts an html snippet demonstrating its usage.
