
<h1>Browse {$catname|escape:"htmlall"}</h1>

{$site->adbrowse}	

{if $shows}
<p>
<a href="{$smarty.const.WWW_TOP}/series" title="View available TV series">Series List</a> | 
<a title="Manage your shows" href="{$smarty.const.WWW_TOP}/myshows">Manage My Shows</a> | 
<a title="All releases in your shows as an RSS feed" href="{$smarty.const.WWW_TOP}/rss?t=-3&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}">Rss Feed</a>
</p>
{/if}
	
{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">

<div class="nzb_multi_operations">
	{if $section != ''}View: <a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}">Covers</a> | <b>List</b><br />{/if}
	<small>With Selected:</small>
	<input type="button" class="nzb_multi_operations_download" value="Download NZBs" />
	<input type="button" class="nzb_multi_operations_cart" value="Add to Cart" />
	{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab" value="Send to SAB" />{/if}
	{if $isadmin}
	&nbsp;&nbsp;
	<input type="button" class="nzb_multi_operations_edit" value="Edit" />
	<input type="button" class="nzb_multi_operations_delete" value="Del" />
	{/if}	
</div>

{$pager}

<table style="width:100%;" class="data highlight icons" id="browsetable">
	<tr>
		<th><input id="chkSelectAll" type="checkbox" class="nzb_check_all" /><label for="chkSelectAll" style="display:none;">Select All</label></th>
		<th>name<br/><a title="Sort Descending" href="{$orderbyname_desc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_down.gif" alt="Sort Descending" /></a><a title="Sort Ascending" href="{$orderbyname_asc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_up.gif" alt="Sort Ascending" /></a></th>
		<th>category<br/><a title="Sort Descending" href="{$orderbycat_desc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_down.gif" alt="Sort Descending" /></a><a title="Sort Ascending" href="{$orderbycat_asc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_up.gif" alt="Sort Ascending" /></a></th>
		<th>posted<br/><a title="Sort Descending" href="{$orderbyposted_desc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_down.gif" alt="Sort Descending" /></a><a title="Sort Ascending" href="{$orderbyposted_asc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_up.gif" alt="Sort Ascending" /></a></th>
		<th>size<br/><a title="Sort Descending" href="{$orderbysize_desc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_down.gif" alt="Sort Descending" /></a><a title="Sort Ascending" href="{$orderbysize_asc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_up.gif" alt="Sort Ascending" /></a></th>
		<th>files<br/><a title="Sort Descending" href="{$orderbyfiles_desc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_down.gif" alt="Sort Descending" /></a><a title="Sort Ascending" href="{$orderbyfiles_asc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_up.gif" alt="Sort Ascending" /></a></th>
		<th>stats<br/><a title="Sort Descending" href="{$orderbystats_desc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_down.gif" alt="Sort Descending" /></a><a title="Sort Ascending" href="{$orderbystats_asc}"><img src="{$smarty.const.WWW_TOP}/templates/simple/images/sorting/arrow_up.gif" alt="Sort Ascending" /></a></th>
		<th></th>
	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}{if $lastvisit|strtotime<$result.adddate|strtotime} new{/if}" id="guid{$result.guid}">
			<td class="check"><input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" value="{$result.guid}" /></td>
			<td class="item">
			<label for="chk{$result.guid|substr:0:7}"><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.searchname|escape:"htmlall"|replace:".":" "}</a></label>
				
				{if $result.passwordstatus == 2}
					<img title="Passworded Rar Archive" src="{$smarty.const.WWW_TOP}/templates/simple/images/icons/lock.gif" alt="Passworded Rar Archive" />
				{elseif $result.passwordstatus == 1}
					<img title="Contains .cab/ace/rar Archive" src="{$smarty.const.WWW_TOP}/templates/simple/images/icons/lock.gif" alt="Contains .cab/ace/rar Archive" />
				{/if}

				{if $userdata.canpre == 1 && $result.nuketype != ''}
					&nbsp;<img title="{$result.nuketype}" src="{$smarty.const.WWW_TOP}/templates/simple/images/icons/nuke.png" width="10" height="10" alt="{$result.nuketype}" />
				{/if}
				
				<div class="resextra">
					<div class="btns">{strip}
						{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="modal_nfo rndbtn" rel="nfo">Nfo</a>{/if}
						{if $result.preID > 0 && $userdata.canpre == 1}<span class="preinfo rndbtn" title="{$result.searchname}">Pre'd {$result.ctime|timeago}</span>{/if}
						{if $result.movieinfoID > 0}<a href="{$smarty.const.WWW_TOP}/movies?imdb={$result.imdbID}" title="View movie info" class="rndbtn" rel="movie" >Movie</a>{/if}
						{if $result.haspreview == 1 && $userdata.canpreview == 1}<a href="{$smarty.const.WWW_TOP}/covers/preview/{$result.guid}_thumb.jpg" name="name{$result.guid}" title="View Screenshot" class="modal_prev rndbtn" rel="preview">Preview</a>{/if}
						{if $result.haspreview == 2 && $userdata.canpreview == 1}<a href="#" name="audio{$result.guid}" title="Listen to {$result.searchname|escape:"htmlall"}" class="audioprev rndbtn" rel="audio">Listen</a><audio id="audprev{$result.guid}" preload="none"><source src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" type="audio/mpeg"><source src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.ogg" type="audio/ogg"></audio>{/if}
						{if $result.musicinfoID > 0}<a href="#" name="name{$result.musicinfoID}" title="View music info" class="modal_music rndbtn" rel="music" >Cover</a>{/if}
						{if $result.consoleinfoID > 0}<a href="#" name="name{$result.consoleinfoID}" title="View console info" class="modal_console rndbtn" rel="console" >Cover</a>{/if}
						{if $result.bookinfoID > 0}<a href="#" name="name{$result.bookinfoID}" title="View book info" class="modal_book rndbtn" rel="console" >Cover</a>{/if}
						{if $result.rageID > 0}<a class="rndbtn" href="{$smarty.const.WWW_TOP}/series/{$result.rageID}" title="View all episodes">View Series</a>{/if}
						{if $result.anidbID > 0}<a class="rndbtn" href="{$smarty.const.WWW_TOP}/anime/{$result.anidbID}" title="View all episodes">View Anime</a>{/if}
						{if $result.tvairdate != ""}<span class="seriesinfo rndbtn" title="{$result.guid}">Aired {if $result.tvairdate|strtotime > $smarty.now}in future{else}{$result.tvairdate|daysago}{/if}</span>{/if}
						{if $result.reID > 0}<span class="mediainfo rndbtn" title="{$result.guid}">Media</span>{/if}
					{/strip}</div>
				</div>
			</td>
			<td class="less"><a title="Browse {$result.category_name}" href="{$smarty.const.WWW_TOP}/browse?t={$result.categoryID}">{$result.category_name}</a></td>
			<td class="less mid" title="{$result.postdate}">{$result.postdate|timeago}</td>
			<td class="less right">{$result.size|fsize_format:"MB"}{if $result.completion > 0}<br />{if $result.completion < 100}<span class="warning">{$result.completion}%</span>{else}{$result.completion}%{/if}{/if}</td>
			<td class="less mid">
				<a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart}</a>
				{if $result.rarinnerfilecount > 0}
					<div class="rarfilelist">
						<img src="{$smarty.const.WWW_TOP}/templates/simple/images/icons/magnifier.png" alt="{$result.guid}" class="tooltip" />				
					</div>
				{/if}
			</td>
			<td class="less nowrap"><a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{$result.comments} cmt{if $result.comments != 1}s{/if}</a><br/>{$result.grabs} grab{if $result.grabs != 1}s{/if}</td>
			<td class="icons">
				<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}">&nbsp;</a></div>
				<div class="icon icon_cart" title="Add to Cart"></div>
				{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
			</td>
		</tr>
	{/foreach}
	
</table>
<br/>

{$pager}

<div class="nzb_multi_operations">
	<small>With Selected:</small>
	<input type="button" class="nzb_multi_operations_download" value="Download NZBs" />
	<input type="button" class="nzb_multi_operations_cart" value="Add to Cart" />
	{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab" value="Send to SAB" />{/if}
	{if $isadmin}
	&nbsp;&nbsp;
	<input type="button" class="nzb_multi_operations_edit" value="Edit" />
	<input type="button" class="nzb_multi_operations_delete" value="Del" />
	{/if}	
</div>

</form>

{/if}

<br/><br/><br/>
