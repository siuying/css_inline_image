CssInlineImage
==============

A Rails plugin that automatically replace assets specified in stylesheets with Data URI representations.

Why?
====

Using Data URI to encode the assets files into stylesheets dramatically reduce the number of HTTP requests to web server. This is a optimization technique when you want to further improve the performance of a sites. Check this post for details: [Data URIs make CSS sprites obsolete](http://www.nczonline.net/blog/2010/07/06/data-uris-make-css-sprites-obsolete/).

Example
=======

Just use regular stylesheet_link_tag with "cache" options:

	<%= stylesheet_link_tag "default", "header", "footer", :cache => "common" %>

As usual, in production mode, rails will generate following stylesheet tag:

	<link href="/stylesheets/commons.css?1278520653" media="screen" rel="stylesheet" type="text/css" />

Where common.css combine all content of "default.css", "header.css" and "footer.css". After using this plugin, all images specified by url() in the stylesheet files will be replaced with data uri representation. For example:

    .striped_box
    {
    	width: 100px;
    	height: 100px;
    	background-image: url("images/bg.gif");
    }

will be replace with

	.striped_box
	{
		width: 100px;
		height: 100px;
		background-image: url("data:image/gif;base64,R0lGODlhAwADAIAAAP///8zMzCH5BAAAAAAALAAAAAADAAMAAAIEBHIJBQA7");
	}

Reference
=========

* [Data URIs make CSS sprites obsolete](http://www.nczonline.net/blog/2010/07/06/data-uris-make-css-sprites-obsolete/)
* [Data URIs explained](http://www.nczonline.net/blog/2009/10/27/data-uris-explained/)
* [Using Data URLs Effectively with Cascading Style Sheets](http://www.sveinbjorn.org/dataurls_css)

Copyright (c) 2010 Francis Chong, released under the MIT license
