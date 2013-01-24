MinimalistCms
=============

The simplest CMS ever. This project is a mix between [frontendeditor_ckeditor](https://github.com/GCorbel/frontendeditor_ckeditor) and [acts_as_page](https://github.com/GCorbel/acts_as_page).

What this cms is not doing for
------------------------------

This gem is a very simple CMS. If you want a complete CMS interface, use [RefineryCMS](https://github.com/refinery/refinerycms). If you want a simple multisite manager, use [locomotivecms](https://github.com/locomotivecms/engine). If you want to use a huge, terrible and horrible monster, use Joomla! (No, seriously, don’t use Joomla! Never).

What this cms is doing for
--------------------------

This gem is integrable with any tool. It is just a page model with an editor. See the section Tool suggested to have some ideas.

The goal is to use a simple CMS which simply manage pages and use the powerful of rails to manage other part of a website like the contact page, images, etc. It's also good to use the strength of other tool.

Installation
------------

1. Add `minimalist_cms` in your Gemfile;
2. Run `rake minimalist_cms_engine:install:migrations db:migrate`;
3. Create a new file `app\assets\javascripts\minimalist_cms` like this :
    
    ```
    //= require jquery
    //= require jquery_ujs
    //= require underscore
    //= require backbone
    //= require jquery.ui.effect-highlight.js
    //= require ckeditor/init_ckeditor
    //= require frontend_editor/frontend_editor
    //= require minimalist_cms/minimalist_cms
    ```
    You must to add only the libraries you don't have included yet;

4. The the css file minamlist_cms/minimalist_cms to have access to the editor. Include them when the use is an admin;

Usage
-----

You can create a page which your favorite administration tool.

This is an example :

1. Run `rails console`;
2. Execute `Page.create(title: 'welcome', body: 'this is a welcome page')`;

Now, you can go to this address : `localhost:3000/welcome` To edit the page, include the css and javascript file a mark in the installation section. You should have a toolbar which hillight the editable section. When you click on a section, an editor appear. Modify the text like you want;

If you whant to mark a page as the home page you can do execte `page.update_attribute('home', true)`. Your page should be accessible at this address `http://localhost:3000/`.

You can mark a page as a draft. To hide the page, you must to change your code.

Customize the model
-------------------

You can override the page model with `rails generate model Page`. You must to add the line `acts_as_page` in you new model.

Customize the view
------------------

To customize the view you can override the file `app/views/pages/show.html.erb`. To have the editable zone you must to add this line `<%= editable @page { @page.body } %>`.
Add a page in an existing page

You can add your page anywhere you want.

Add something like this in you controller :

    class WelcomeController < ApplicationController
      def index
        @page = Page.where(home: true).first
      end
    end

Now, you can edit the file `app/views/welcome/index.html` and add this :

    <%= editable @page { @page.body } %>

Tool suggested
--------------

With this gem, you can use [ActiveAdmin](https://github.com/gregbell/active_admin) and [activeadmin-globalize3](https://github.com/stefanoverna/activeadmin-globalize3). You can also use [cancan](https://github.com/ryanb/cancan). Your free to use anything you want.
