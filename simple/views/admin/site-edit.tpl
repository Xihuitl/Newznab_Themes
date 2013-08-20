<h1>{$page->title}</h1>

<form action="{$SCRIPT_NAME}?action=submit" method="post">

{if $error != ''}
	<div class="error">{$error}</div>
{/if}

<fieldset>
<legend>Main Site Settings, HTML Layout, Tags</legend>
<table class="input">

<tr>
	<td><label for="title">Title</label>:</td>
	<td>
		<input id="title" class="long" name="title" type="text" value="{$fsite->title}" />
		<div class="hint">Displayed around the site and contact form as the name for the site.</div>
	</td>
</tr>

<tr>
	<td><label for="strapline">Strapline</label>:</td>
	<td>
		<input id="strapline" class="long" name="strapline" type="text" value="{$fsite->strapline}" />
		<div class="hint">Displayed in the header on every public page.</div>
	</td>
</tr>

<tr>
	<td><label for="metatitle">Meta Title</label>:</td>
	<td>
		<input id="metatitle" class="long" name="metatitle" type="text" value="{$fsite->metatitle}" />
		<div class="hint">Stem meta-tag appended to all page title tags.</div>
	</td>
</tr>


<tr>
	<td><label for="metadescription">Meta Description</label>:</td>
	<td>
		<textarea id="metadescription" name="metadescription">{$fsite->metadescription}</textarea>
		<div class="hint">Stem meta-description appended to all page meta description tags.</div>
	</td>
</tr>

<tr>
	<td><label for="metakeywords">Meta Keywords</label>:</td>
	<td>
		<textarea id="metakeywords" name="metakeywords">{$fsite->metakeywords}</textarea>
		<div class="hint">Stem meta-keywords appended to all page meta keyword tags.</div>
	</td>
</tr>

<tr>
	<td><label for="footer">Footer</label>:</td>
	<td>
		<textarea id="footer" name="footer">{$fsite->footer}</textarea>
		<div class="hint">Displayed in the footer section of every public page.</div>
	</td>
</tr>

<tr>
	<td><label for="style">Default Home Page</label>:</td>
	<td>
		<input id="home_link" class="long" name="home_link" type="text" value="{$fsite->home_link}" />
		<div class="hint">The relative path to a the landing page shown when a user logs in, or clicks the home link.</div>
	</td>
</tr>

<tr>
	<td style="width:160px;"><label for="codename">Code Name</label>:</td>
	<td>
		<input id="codename" name="code" type="text" value="{$fsite->code}" />
		<input type="hidden" name="id" value="{$fsite->id}" />
		<div class="hint">A just for fun value shown in debug and not on public pages.</div>
	</td>
</tr>

<tr>
	<td><label for="style">Theme</label>:</td>
	<td>
		{html_options class="siteeditstyle" id="style" name='style' values=$themelist output=$themelist selected=$fsite->style}
		<div class="hint">The theme folder which will be loaded for css and images and overriden templates.</div>
	</td>
</tr>

<tr>
	<td><label for="style">User Menu Position</label>:</td>
	<td>
		{html_options class="siteeditmenuposition" id="menuposition" name='menuposition' values=$menupos_ids output=$menupos_names selected=$fsite->menuposition}
		<div class="hint">Where the menu should appear. Moving the menu to the top will require using a theme which widens the content panel. (e.g. nzbsu theme)</div>
	</td>
</tr>

<tr>
	<td><label for="style">Dereferrer Link</label>:</td>
	<td>
		<input id="dereferrer_link" class="long" name="dereferrer_link" type="text" value="{$fsite->dereferrer_link}" />
		<div class="hint">Optional URL to prepend to external links</div>
	</td>
</tr>

<tr>
	<td><label for="apienabled">Api Enabled</label>:</td>
	<td>
		{html_radios id="apienabled" name='apienabled' values=$yesno_ids output=$yesno_names selected=$fsite->apienabled separator='<br />'}
		<div class="hint">Whether access to the site via the API is enabled.</div>
	</td>
</tr>

<tr>
	<td style="width:160px;"><label for="showrecentforumposts">Recent Forum Posts</label>:</td>
	<td>
		<input id="showrecentforumposts" name="showrecentforumposts" type="text" value="{$fsite->showrecentforumposts}" />
		<div class="hint">The number of recent forum posts to show in the 'recent forum posts' widget. Set to 0 to disable.</div>
	</td>
</tr>

<tr>
	<td><label for="email">Email</label>:</td>
	<td>
		<input id="email" class="long" name="email" type="text" value="{$fsite->email}" />
		<div class="hint">Shown in the contact us page, and where the contact html form is sent to.</div>
	</td>
</tr>

<tr>
	<td><label for="tandc">Terms and Conditions</label>:</td>
	<td>
		<textarea id="tandc" name="tandc">{$fsite->tandc}</textarea>
		<div class="hint">Text displayed in the terms and conditions page.</div>
	</td>
</tr>

<tr>
	<td><label for="newznabID">newznab ID</label>:</td>
	<td>
		<input id="newznabID" class="long" name="newznabID" type="text" value="{$fsite->newznabID}" />
		<div class="hint">Your registered newznab ID. Used for access to additional features.</div>
	</td>
</tr>

</table>
</fieldset>

<fieldset>
<legend>Google Adsense, Analytics and 3rd Party Banners</legend>
<table class="input">
<tr>
	<td style="width:160px;"><label for="google_analytics_acc">Google Analytics</label>:</td>
	<td>
		<input id="google_analytics_acc" name="google_analytics_acc" type="text" value="{$fsite->google_analytics_acc}" />
		<div class="hint">e.g. UA-xxxxxx-x</div>
	</td>
</tr>

<tr>
	<td style="width:160px;"><label for="google_adsense_acc">Google Adsense</label>:</td>
	<td>
		<input id="google_adsense_acc" name="google_adsense_acc" type="text" value="{$fsite->google_adsense_acc}" />
		<div class="hint">e.g. pub-123123123123123</div>
	</td>
</tr>

<tr>
	<td><label for="google_adsense_search">Google Adsense Search</label>:</td>
	<td>
		<input id="google_adsense_search" name="google_adsense_search" type="text" value="{$fsite->google_adsense_search}" />
		<div class="hint">The ID of the google search ad panel displayed at the bottom of the left menu.</div>
	</td>
</tr>

<tr>
	<td><label for="adheader">Advert Space in Banner</label>:</td>
	<td>
		<textarea id="adheader" name="adheader">{$fsite->adheader}</textarea>
		<div class="hint">The banner slot in the header.</div>
	</td>
</tr>

<tr>
	<td><label for="adbrowse">Advert Space in Browse List</label>:</td>
	<td>
		<textarea id="adbrowse" name="adbrowse">{$fsite->adbrowse}</textarea>
		<div class="hint">The banner slot in the header.</div>
	</td>
</tr>

<tr>
	<td><label for="addetail">Advert Space in Detail View</label>:</td>
	<td>
		<textarea id="addetail" name="addetail">{$fsite->addetail}</textarea>
		<div class="hint">The banner slot in the release details view.</div>
	</td>
</tr>

</table>
</fieldset>


<fieldset>
<legend>3<sup>rd</sup> Party API Keys</legend>
<table class="input">
<tr>
	<td style="width:160px;"><label for="tmdbkey">TMDB Key</label>:</td>
	<td>
		<input id="tmdbkey" class="long" name="tmdbkey" type="text" value="{$fsite->tmdbkey}" />
		<div class="hint">The api key used for access to tmdb</div>
	</td>
</tr>

<tr>
	<td style="width:160px;"><label for="rottentomatokey">Rotten Tomatoes Key</label>:</td>
	<td>
		<input id="rottentomatokey" class="long" name="rottentomatokey" type="text" value="{$fsite->rottentomatokey}" />
		<div class="hint">The api key used for access to rotten tomatoes</div>
	</td>
</tr>

<tr>
	<td><label for="amazonpubkey">Amazon Public Key</label>:</td>
	<td>
		<input id="amazonpubkey" class="long" name="amazonpubkey" type="text" value="{$fsite->amazonpubkey}" />
		<div class="hint">The amazon public api key. Used for cover lookups.</div>
	</td>
</tr>

<tr>
	<td><label for="amazonprivkey">Amazon Private Key</label>:</td>
	<td>
		<input id="amazonprivkey" class="long" name="amazonprivkey" type="text" value="{$fsite->amazonprivkey}" />
		<div class="hint">The amazon private api key. Used for cover lookups.</div>
	</td>
</tr>

<tr>
	<td><label for="amazonassociatetag">Amazon Associate Tag</label>:</td>
	<td>
		<input id="amazonassociatetag" class="long" name="amazonassociatetag" type="text" value="{$fsite->amazonassociatetag}" />
		<div class="hint">The amazon associate tag. Used for cover lookups.</div>
	</td>
</tr>

</table>
</fieldset>

<fieldset>
<legend>3<sup>rd</sup> Party Application Paths</legend>
<table class="input">
<tr>
	<td style="width:160px;"><label for="unrarpath">Unrar Path</label>:</td>
	<td>
		<input id="unrarpath" class="long" name="unrarpath" type="text" value="{$fsite->unrarpath}" />
		<div class="hint">The path to an unrar binary, used in deep password detection and media info grabbing.
		<br/>Use forward slashes in windows <span style="font-family:courier;">c:/path/to/unrar.exe</span></div>
	</td>
</tr>

<tr>
	<td><label for="tmpunrarpath">Temp Unrar File Path</label>:</td>
	<td>
		<input id="tmpunrarpath" class="long" name="tmpunrarpath" type="text" value="{$fsite->tmpunrarpath}" />
		<div class="hint">The path to where unrar puts files. WARNING: This directory will have its contents deleted.
		<br/>Use forward slashes in windows <span style="font-family:courier;">c:/temp/path/stuff/will/be/unpacked/to</span></div>
	</td>
</tr>

<tr>
	<td><label for="mediainfopath">Mediainfo Path</label>:</td>
	<td>
		<input id="mediainfopath" class="long" name="mediainfopath" type="text" value="{$fsite->mediainfopath}" />
		<div class="hint">The path to the <a href="http://mediainfo.sourceforge.net">mediainfo</a> binary. Used for deep file media analysis. Use empty path to disable mediainfo checks
		<br/>Use forward slashes in windows <span style="font-family:courier;">c:/path/to/mediainfo.exe</span></div>
	</td>
</tr>

<tr>
	<td><label for="ffmpegpath">Ffmpeg Path</label>:</td>
	<td>
		<input id="ffmpegpath" class="long" name="ffmpegpath" type="text" value="{$fsite->ffmpegpath}" />
		<div class="hint">The path to the <a href="http://www.ffmpeg.org/">ffmpeg</a> binary. Used for thumbnailing. Use empty path to disable thumbnailing.
		<br/>Use forward slashes in windows <span style="font-family:courier;">c:/path/to/ffmpeg.exe</span></div>
	</td>
</tr>

<tr>
	<td><label for="lamepath">Lame Path</label>:</td>
	<td>
		<input id="lamepath" class="long" name="lamepath" type="text" value="{$fsite->lamepath}" />
		<div class="hint">The path to the <a href="http://lame.sourceforge.net/download.php">lame</a> binary. Used for audio manipulation.
		<br/>Use forward slashes in windows <span style="font-family:courier;">c:/path/to/lame.exe</span></div>
	</td>
</tr>

</table>
</fieldset>


<fieldset>
<legend>SABnzbd Integration Settings</legend>
<table class="input">
<tr>
	<td style="width:160px;"><label for="sabintegrationtype">Integration Type</label>:</td>
	<td>
		{html_radios id="sabintegrationtype" name='sabintegrationtype' values=$sabintegrationtype_ids output=$sabintegrationtype_names selected=$fsite->sabintegrationtype separator='<br />'}
		<div class="hint">Whether to allow integration with a SAB install and if so what type of integration<br/></div>
	</td>
</tr>

<tr>
	<td><label for="saburl">SABnzbd Url</label>:</td>
	<td>
		<input id="saburl" class="long" name="saburl" type="text" value="{$fsite->saburl}" />
		<div class="hint">The url of the SAB installation, for example: http://localhost:8080/sabnzbd/</div>
	</td>
</tr>

<tr>
	<td><label for="sabapikey">SABnzbd Api Key</label>:</td>
	<td>
		<input id="sabapikey" class="long" name="sabapikey" type="text" value="{$fsite->sabapikey}" />
		<div class="hint">The Api key of the SAB installation. Can be the full api key or the nzb api key (as of SAB 0.6)</div>
	</td>
</tr>

<tr>
	<td><label for="sabapikeytype">Api Key Type</label>:</td>
	<td>
		{html_radios id="sabapikeytype" name='sabapikeytype' values=$sabapikeytype_ids output=$sabapikeytype_names selected=$fsite->sabapikeytype separator='<br />'}
		<div class="hint">Select the type of api key you entered in the above setting</div>
	</td>
</tr>

<tr>
	<td><label for="sabpriority">Priority Level</label>:</td>
	<td>
		{html_options id="sabpriority" name='sabpriority' values=$sabpriority_ids output=$sabpriority_names selected=$fsite->sabpriority}
		<div class="hint">Set the priority level for NZBs that are added to your queue</div>
	</td>
</tr>

<tr>
	<td><label for="sabcompletedir">SABnzbd Complete Path</label>:</td>
	<td>
		<input id="sabcompletedir" class="long" name="sabcompletedir" type="text" value="{$fsite->sabcompletedir}" />
		<div class="hint">The downloads/complete folder for a local sab install, for example: /var/www/sab/downloads/complete</div>
	</td>
</tr>

<tr>
	<td><label for="sabvdir">SABnzbd Complete Vdir URL</label>:</td>
	<td>
		<input id="sabvdir" class="long" name="sabvdir" type="text" value="{$fsite->sabvdir}" />
		<div class="hint">A url to a hosted virtual directory pointing to the sab downloads/complete folder, e.g. http://server/complete</div>
	</td>
</tr>

</table>
</fieldset>


<fieldset>
<legend>Usenet Settings</legend>
<table class="input">

<tr>
	<td><label for="nzbpath">Nzb File Path</label>:</td>
	<td>
		<input id="nzbpath" class="long" name="nzbpath" type="text" value="{$fsite->nzbpath}" />
		<div class="hint">The directory where nzb files will be stored.</div>
	</td>
</tr>

<tr>
	<td><label for="rawretentiondays">Header Retention</label>:</td>
	<td>
		<input class="tiny" id="rawretentiondays" name="rawretentiondays" type="text" value="{$fsite->rawretentiondays}" />
		<div class="hint">The number of days binary and part data will be retained for use in raw search and release formation. <strong>Set to 0 during import to remove headers immediately.</strong></div>
	</td>
</tr>

<tr>
	<td><label for="releaseretentiondays">Release Retention</label>:</td>
	<td>
		<input class="tiny" id="releasedays" name="releaseretentiondays" type="text" value="{$fsite->releaseretentiondays}" />
		<div class="hint">The number of days releases will be retained for use throughout site. Set to 0 to disable.</div>
	</td>
</tr>

<tr>
	<td><label for="minfilestoformrelease">Minimum Files to Make a Release</label>:</td>
	<td>
		<input class="tiny" id="minfilestoformrelease" name="minfilestoformrelease" type="text" value="{$fsite->minfilestoformrelease}" />
		<div class="hint">The minimum number of files to make a release. i.e. if set to two, then releases which only contain one file will not be created.</div>
	</td>
</tr>

<tr>
	<td><label for="minsizetoformrelease">Minimum File Size to Make a Release</label>:</td>
	<td>
		<input class="small" id="minsizetoformrelease" name="minsizetoformrelease" type="text" value="{$fsite->minsizetoformrelease}" />
		<div class="hint">The minimum total size in bytes to make a release. If set to 0, then ignored.</div>
	</td>
</tr>

<tr>
        <td><label for="completionpercent">Minimum Completion Percent to Make a Release</label>:</td>
        <td>
                <input class="tiny" id="completionpercent" name="completionpercent" type="text" value="{$fsite->completionpercent}" />
                <div class="hint">The minimum completion percent to make a release. i.e. if set to 97, then releases under 97% completion will not be created. If set to 0, then ignored.</div>
        </td>
</tr>

<tr>
	<td><label for="removespam">Remove Spam</label>:</td>
	<td>
		{html_radios id="removespam" name='removespam' values=$yesno_ids output=$yesno_names selected=$fsite->removespam separator='<br />'}
		<div class="hint">Find and remove spam after each update. An inexact science which uses a few methods to identify virus/spam posts.</div>
	</td>
</tr>

<tr>
	<td><label for="exepermittedcategories">Spam - Accepted Exe Categories</label>:</td>
	<td>
		<input id="exepermittedcategories" class="long" name="exepermittedcategories" type="text" value="{$fsite->exepermittedcategories}" />
		<div class="hint">Which categories to permit .exe files. Requires unrar inner file checking to be enabled.</div>
	</td>
</tr>


<tr>
	<td><label for="compressedheaders">Use Compressed Headers</label>:</td>
	<td>
		{html_radios class="$compress_headers_warning" id="compressedheaders" name='compressedheaders' values=$yesno_ids output=$yesno_names selected=$fsite->compressedheaders separator='<br />'}
		<div class="hint">Some servers allow headers to be sent over in a compressed format.  If enabled this will use much less bandwidth, but processing times may increase.</div>
	</td>
</tr>


<tr>
	<td><label for="maxmssgs">Max Messages</label>:</td>
	<td>
		<input class="small" id="maxmssgs" name="maxmssgs" type="text" value="{$fsite->maxmssgs}" />
		<div class="hint">The maximum number of messages to fetch at a time from the server.</div>
	</td>
</tr>
<tr>
	<td><label for="newgroupscanmethod">Where to start new groups</label>:</td>
	<td>
		{html_radios id="newgroupscanmethod" name='newgroupscanmethod' values=$yesno_ids output=$newgroupscan_names selected=$fsite->newgroupscanmethod separator='<br />'}
		<input class="tiny" id="newgroupdaystoscan" name="newgroupdaystoscan" type="text" value="{$fsite->newgroupdaystoscan}" /> Days  or
		<input class="small" id="newgroupmsgstoscan" name="newgroupmsgstoscan" type="text" value="{$fsite->newgroupmsgstoscan}" /> Posts<br />
		<div class="hint">Scan back X (posts/days) for each new group?  Can backfill to scan further.</div>
	</td>
</tr>

</table>
</fieldset>

<fieldset>
<legend>Lookup Settings</legend>
<table class="input">
<tr>
	<td><label for="reqidurl">Allfilled Request Id Lookup URL</label>:</td>
	<td>
		<input class="long" id="reqidurl" name="reqidurl" type="text" value="{$fsite->reqidurl}" />
		<div class="hint">The url to use to translate allfilled style reqid usenet posts into real release titles. Leave blank to not perform lookup.</div>
	</td>
</tr>

<tr>
	<td><label for="reqidurl">Latest Regex Lookup URL</label>:</td>
	<td>
		<input class="long" id="latestregexurl" name="latestregexurl" type="text" value="{$fsite->latestregexurl}" />
		<div class="hint">The url to use to get the latest regexs. Leave blank to not perform lookup. This will retrieve all user contributed regexes.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupnfo">Lookup Nfo</label>:</td>
	<td>
		{html_radios id="lookupnfo" name='lookupnfo' values=$yesno_ids output=$yesno_names selected=$fsite->lookupnfo separator='<br />'}
		<div class="hint">Whether to attempt to retrieve the an nfo file from usenet when processing binaries.<br/><strong>NOTE: disabling nfo lookups will disable movie lookups.</strong></div>
	</td>
</tr>

<tr>
	<td><label for="lookuptvrage">Lookup TV Rage</label>:</td>
	<td>
		{html_radios id="lookuptvrage" name='lookuptvrage' values=$yesno_ids output=$yesno_names selected=$fsite->lookuptvrage separator='<br />'}
		<div class="hint">Whether to attempt to lookup tv rage ids on the web when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupthetvdb">Lookup TheTVDB</label>:</td>
	<td>
		{html_radios id="lookupthetvdb" name='lookupthetvdb' values=$yesno_ids output=$yesno_names selected=$fsite->lookupthetvdb separator='<br />'}
		<div class="hint">Whether to attempt to lookup addidional series information from TheTVDB when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupimdb">Lookup Movies</label>:</td>
	<td>
		{html_radios id="lookupimdb" name='lookupimdb' values=$yesno_ids output=$yesno_names selected=$fsite->lookupimdb separator='<br />'}
		<div class="hint">Whether to attempt to lookup film information from IMDB or TheMovieDB when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupanidb">Lookup AniDB</label>:</td>
	<td>
		{html_radios id="lookupanidb" name='lookupanidb' values=$yesno_ids output=$yesno_names selected=$fsite->lookupanidb separator='<br />'}
		<div class="hint">Whether to attempt to lookup anime information from AniDB when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupmusic">Lookup Music</label>:</td>
	<td>
		{html_radios id="lookupmusic" name='lookupmusic' values=$yesno_ids output=$yesno_names selected=$fsite->lookupmusic separator='<br />'}
		<div class="hint">Whether to attempt to lookup music information from Amazon when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupgames">Lookup Games</label>:</td>
	<td>
		{html_radios id="lookupgames" name='lookupgames' values=$yesno_ids output=$yesno_names selected=$fsite->lookupgames separator='<br />'}
		<div class="hint">Whether to attempt to lookup game information from Amazon when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="lookupbooks">Lookup Books</label>:</td>
	<td>
		{html_radios id="lookupbooks" name='lookupbooks' values=$yesno_ids output=$yesno_names selected=$fsite->lookupbooks separator='<br />'}
		<div class="hint">Whether to attempt to lookup book information from Amazon when processing binaries.</div>
	</td>
</tr>

<tr>
	<td><label for="saveaudiopreview">Save Audio Preview</label>:</td>
	<td>
		{html_radios id="saveaudiopreview" name='saveaudiopreview' values=$yesno_ids output=$yesno_names selected=$fsite->saveaudiopreview separator='<br />'}
		<div class="hint">Whether to save a preview of an audio release (requires deep rar inspection enabled).<br/>It is advisable to specify a path to the lame binary to reduce the size of audio previews.</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="audiopreviewprune">Prune Audio Preview</label>:</td>
	<td>
		<input id="audiopreviewprune" class="short" name="audiopreviewprune" type="text" value="{$fsite->audiopreviewprune}" />
		<div class="hint">Delete any audio previews older than this number of days.</div>
	</td>
</tr>

</table>
</fieldset>

<fieldset>
<legend>Password Settings</legend>
<table class="input">
<tr>
	<td><label for="checkpasswordedrar">Check For Passworded Releases</label>:</td>
	<td>
		{html_radios id="checkpasswordedrar" name='checkpasswordedrar' values=$passwd_ids output=$passwd_names selected=$fsite->checkpasswordedrar separator='<br />'}
		<div class="hint">Whether to attempt to peek into every release, to see if rar files are password protected.<br/></div>
	</td>
</tr>

<tr>
	<td><label for="deletepasswordedrelease">Delete Passworded Releases</label>:</td>
	<td>
		{html_radios id="deletepasswordedrelease" name='deletepasswordedrelease' values=$yesno_ids output=$yesno_names selected=$fsite->deletepasswordedrelease separator='<br />'}
		<div class="hint">Whether to delete releases which are passworded or potentially passworded.<br/></div>
	</td>
</tr>

<tr>
	<td><label for="showpasswordedrelease">Show Passworded Releases</label>:</td>
	<td>
		{html_options id="showpasswordedrelease" name='showpasswordedrelease' values=$passworded_ids output=$passworded_names selected=$fsite->showpasswordedrelease}
		<div class="hint">Whether to show passworded or potentially passworded releases in browse, search, api and rss feeds. Potentially passworded means releases which contain .cab or .ace files which are typically password protected.</div>
	</td>
</tr>
</table>
</fieldset>

<fieldset>
<legend>nzpre Settings</legend>
<table class="input">

<tr>
	<td style="width:130px;"><label for="nzpregroup">Group</label>:</td>
	<td>
		<input id="nzpregroup" class="medium" name="nzpregroup" type="text" value="{$fsite->nzpregroup}" />
		<div class="hint">Group to search when looking up nzpre posts.</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="nzpresubject">Subject</label>:</td>
	<td>
		<input id="nzpresubject" class="long" name="nzpresubject" type="text" value="{$fsite->nzpresubject}" />
		<div class="hint">Subject line. eg. This is an nzpre post!</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="nzpreposter">Poster</label>:</td>
	<td>
		<input id="nzpreposter" class="medium" name="nzpreposter" type="text" value="{$fsite->nzpreposter}" />
		<div class="hint">Full poster field. eg. tester test@test.com</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="nzprefield">Field</label>:</td>
	<td>
		<input id="nzprefield" class="medium" name="nzprefield" type="text" value="{$fsite->nzprefield}" />
		<div class="hint">Which header field to parse.</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="nzprearticles">Articles</label>:</td>
	<td>
		<input id="nzprearticles" class="short" name="nzprearticles" type="text" value="{$fsite->nzprearticles}" />
		<div class="hint">Number of articles to parse when updating.</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="nzprekey">Key</label>:</td>
	<td>
		<input id="nzprekey" class="long" name="nzprekey" type="text" value="{$fsite->nzprekey}" />
		<div class="hint">Key to decode.</div>
	</td>
</tr>

</table>
</fieldset>

<fieldset>
<legend>Sphinx Settings</legend>
<table class="input">
    <tr>
    	<td><label for="sphinxenabled">Use Sphinx</label>:</td>
    	<td>
    		{html_radios class="$sphinx_enabled" id="sphinxenabled" name='sphinxenabled' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxenabled separator='<br />'}
    		<div class="hint">Enable or disable Sphinx.</div>
    	</td>
    </tr>
    <tr>
    	<td><label for="sphinxindexnzbs">Index NZB Contents</label>:</td>
    	<td>
    		{html_radios class="$sphinx_indexnzbs" id="sphinxindexnzbs" name='sphinxindexnzbs' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexnzbs separator='<br />'}
    		<div class="hint">Enable or disable indexing of NZB file contents.</br>
    		    NOTE: enabling this option will <strong>significantly</strong>increase processing time.</div>
    	</td>
    </tr>
    <tr>
    	<td><label for="sphinxindexnfos">Index NFO Contents</label>:</td>
    	<td>
    		{html_radios class="$sphinx_indexnfos" id="sphinxindexnfos" name='sphinxindexnfos' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexnfos separator='<br />'}
    		<div class="hint">Enable or disable indexing of NFO contents.</div>
    	</td>
    </tr>
    <tr>
    	<td><label for="sphinxindexreleasefiles">Index ReleaseFiles</label>:</td>
    	<td>
    		{html_radios class="$sphinx_indexreleasefiles" id="sphinxindexreleasefiles" name='sphinxindexreleasefiles' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexreleasefiles separator='<br />'}
    		<div class="hint">Enable or disable indexing of releasefiles table.</div>
    	</td>
    </tr>
    <tr>
    	<td><label for="sphinxindexpredb">Index PreDB</label>:</td>
    	<td>
    		{html_radios class="$sphinx_indexpredb" id="sphinxindexpredb" name='sphinxindexpredb' values=$yesno_ids output=$yesno_names selected=$fsite->sphinxindexpredb separator='<br />'}
    		<div class="hint">Enable or disable indexing of PreDB.</div>
    	</td>
    </tr>
    <tr>
    	<td style="width:130px;"><label for="sphinxserverhost">Search Server Host</label>:</td>
    	<td>
    		<input id="sphinxserverhost" class="long" name="sphinxserverhost" type="text" value="{$fsite->sphinxserverhost}" />
    		<div class="hint">Hostname and port of the Sphinx server (<code>searchd</code>).<br/>
    		    NOTE: This should be the host and port on which the
    		    <a target="_blank" href="http://sphinxsearch.com/docs/2.0.1/conf-listen.html">mysql41</a> protocol is being
    		    served.  <br />Default is <code>127.0.0.1:9306</code>.  Unless you've manually modified <code>sphinx.conf</code>, you shouldn't have to change this.</div>
    	</td>
    </tr>
    <tr>
    	<td style="width:130px;"><label for="sphinxconfpath">Sphinx Configuration Path</label>:</td>
    	<td>
    		<input id="sphinxconfpath" class="long" name="sphinxconfpath" type="text" value="{$fsite->sphinxconfpath}" />
    		<div class="hint">Path to <code>sphinx.conf</code>.</div>
    	</td>
    </tr>
    <tr>
    	<td style="width:130px;"><label for="sphinxbinpath">Sphinx Binaries Path</label>:</td>
    	<td>
    		<input id="sphinxbinpath" class="long" name="sphinxbinpath" type="text" value="{$fsite->sphinxbinpath}" />
    		<div class="hint">Path to directory where you installed the Sphinx binaries.  If you leave this blank it will be assumed that they are installed to a location in your <code>PATH</code></div>
    	</td>
    </tr>
    <tr>
    	<td style="width:130px;"><label for="sphinxsearchfields">Default Search Field(s)</label>:</td>
    	<td>
    		<input id="sphinxsearchfields" class="long" name="sphinxsearchfields" type="text" value="{$fsite->sphinxsearchfields}" />
    		<div class="hint">Comma separated list of fields to search by default.</div>
    	</td>
    </tr>
    <tr>
    	<td><label for="sphinxmergefreq">Merge Frequency</label>:</td>
    	<td>
    		Every day at <input class="tiny" id="sphinxmergefreq" name="sphinxmergefreq" type="text" value="{$fsite->sphinxmergefreq}" /> or 
    		<input style="width: 40px" id="sphinxmergefreq_count" name="sphinxmergefreq_count" type="text" value="{$fsite->sphinxmergefreq_count}" /> records.<br/>
    		<div class="hint">Merge the delta indexes into the main indexes every day at at this time (24-hour format) or once the delta index grows above the given size.</div>
    	</td>
    </tr>
    <tr>
    	<td><label for="">Rebuild Frequency</label>:</td>
    	<td>
    	    Every {html_options id="sphinxrebuildfreq_day" name='sphinxrebuildfreq_day' values=$sphinxrebuildfreqday_days output=$sphinxrebuildfreqday_days selected=$fsite->sphinxrebuildfreq_day} at
    		<input class="tiny" id="sphinxrebuildfreq" name="sphinxrebuildfreq" type="text" value="{$fsite->sphinxrebuildfreq}" /><br />
    		<div class="hint">Day and time to do a full rebuild of the indexes (24-hour format).  Leave day empty to disable automatic rebuilding.</div>
    	</td>
    </tr>
</table>
</fieldset>

<fieldset>
<legend>cURL Proxy Settings</legend>
<table class="input">

<tr>
	<td style="width:130px;"><label for="curlproxyaddress">Address/Port</label>:</td>
	<td>
		<input id="curlproxyaddress" class="medium" name="curlproxyaddress" type="text" value="{$fsite->curlproxyaddress}" />
		<div class="hint">eg. 127.0.0.1:8118</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="curlproxytype">Type</label>:</td>
	<td>
		{html_options class="curlproxytype" id="curlproxytype" name='curlproxytype' values=$curlproxytype_names output=$curlproxytype_names selected=$fsite->curlproxytype}
		<div class="hint">Select HTTP for Tor/Polipo configuration.</div>
	</td>
</tr>

<tr>
	<td style="width:130px;"><label for="curlproxyuserpwd">Username/Password</label>:</td>
	<td>
		<input id="curlproxyuserpwd" class="medium" name="curlproxyuserpwd" type="text" value="{$fsite->curlproxyuserpwd}" />
		<div class="hint">eg. username:password</div>
	</td>
</tr>

</table>
</fieldset>

<fieldset>
<legend>User Settings</legend>
<table class="input">

<tr>
	<td style="width:160px;"><label for="registerstatus">Registration Status</label>:</td>
	<td>
		{html_radios id="registerstatus" name='registerstatus' values=$registerstatus_ids output=$registerstatus_names selected=$fsite->registerstatus separator='<br />'}
		<div class="hint">The status of registrations to the site.</div>
	</td>
</tr>

<tr>
	<td><label for="storeuserips">Store User Ip</label>:</td>
	<td>
		{html_radios id="storeuserips" name='storeuserips' values=$yesno_ids output=$yesno_names selected=$fsite->storeuserips separator='<br />'}
		<div class="hint">Whether to store the users ip address when they signup or login.</div>
	</td>
</tr>

<tr>
  <td style="width:130px;"><label for="userdownloadpurgedays">User Downloads Purge Days</label>:</td>
  <td>
    <input id="userdownloadpurgedays" class="short" name="userdownloadpurgedays" type="text" value="{$fsite->userdownloadpurgedays}" />
    <div class="hint">The number of days to preserve user download history, for use when checking limits being hit. Set to zero will remove all records of what users download, but retain history of when, so that role based limits can still be applied.</div>
  </td>
</tr>

<tr>
  <td style="width:130px;"><label for="userhostexclusion">IP Whitelist</label>:</td>
  <td>
    <input id="userhostexclusion" class="medium" name="userhostexclusion" type="text" value="{$fsite->userhostexclusion}" />
    <div class="hint">A comma separated list of IP addresses which will be excluded from user limits on number of requests and downloads per IP address. Include values for google reader and other shared services which may be being used.</div>
  </td>
</tr>
</table>
</fieldset>

<fieldset>
<legend>Recaptcha</legend>
<table class="input">

<tr>
  <td style="width:130px;"><label for="recaptchapublickey">ReCaptcha Public Key</label>:</td>
  <td>
    <input id="recaptchapublickey" class="medium" name="recaptchapublickey" type="text" value="{$fsite->recaptchapublickey}" />
    <div class="hint">The public key supplied by recaptcha.net. Sign up for recaptcha at <a href="https://www.google.com/recaptcha/admin/create">https://www.google.com/recaptcha/admin/create</a></div>
  </td>
</tr>

<tr>
  <td style="width:130px;"><label for="recaptchaprivatekey">ReCaptcha Private Key</label>:</td>
  <td>
    <input id="recaptchaprivatekey" class="medium" name="recaptchaprivatekey" type="text" value="{$fsite->recaptchaprivatekey}" />
    <div class="hint">The private key supplied by recaptcha.net</div>
  </td>
</tr>



<tr>
	<td><label for="registerrecaptcha">Register Recaptcha</label>:</td>
	<td>
		{html_radios id="registerrecaptcha" name='registerrecaptcha' values=$yesno_ids output=$yesno_names selected=$fsite->registerrecaptcha separator='<br />'}
		<div class="hint">Whether to display a ReCaptcha captcha for registering.</div>
	</td>
</tr>

</table>
</fieldset>

<input type="submit" value="Save Site Settings" />

</form>

