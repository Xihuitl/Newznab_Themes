 
<h1>Profile for {$user.username|escape:"htmlall"}</h1>

<table class="data">
	<tr><th>Username:</th><td>{$user.username|escape:"htmlall"}</td></tr>
	{if $user.ID==$userdata.ID || $userdata.role==2}<tr><th title="Not public">Email:</th><td>{$user.email}</td></tr>{/if}
	<tr><th>Registered:</th><td title="{$user.createddate}">{$user.createddate|date_format}  ({$user.createddate|timeago} ago)</td></tr>
	<tr><th>Last Login:</th><td title="{$user.lastlogin}">{$user.lastlogin|date_format}  ({$user.lastlogin|timeago} ago)</td></tr>
	<tr><th>Role:</th><td>{$user.rolename}</td></tr>
	{if $userdata.role==2}<tr><th title="Admin Notes">Notes:</th><td>{$user.notes|escape:htmlall}{if $user.notes|count_characters > 0}<br/>{/if}<a href="{$smarty.const.WWW_TOP}/admin/user-edit.php?id={$user.ID}#notes">Add/Edit</a></td></tr>{/if}
	{if $user.ID==$userdata.ID || $userdata.role==2}<tr><th title="Not public">Site Api/Rss Key:</th><td><a href="{$smarty.const.WWW_TOP}/rss?t=0&amp;dl=1&amp;i={$user.ID}&amp;r={$user.rsstoken}">{$user.rsstoken}</a></td></tr>{/if}
	{if $user.ID==$userdata.ID || $userdata.role==2}
	<tr><th>API Hits Today:</th><td><span id="uatd">{$apihits.num}</span> {if $userdata.role==2 && $apihits.num > 0}<a onclick="resetapireq({$user.ID}, 'api'); document.getElementById('uatd').innerHTML='0'; return false;" href="#">Reset</a>{/if}</td></tr>
	<tr><th>Grabs Today:</th><td><span id="ugrtd">{$grabstoday.num}</span> {if $grabstoday.num >= $user.downloadrequests}&nbsp;&nbsp;<small>(Next DL in {($grabstoday.nextdl/3600)|intval}h {($grabstoday.nextdl/60) % 60}m)</small>{/if}{if $userdata.role==2 && $grabstoday.num > 0}<a onclick="resetapireq({$user.ID}, 'grabs'); document.getElementById('ugrtd').innerHTML='0'; return false;" href="#">Reset</a>{/if}</td></tr>
	{/if}
	<tr><th>Grabs Total:</th><td>{$user.grabs}</td></tr>
	
	{if ($user.ID==$userdata.ID || $userdata.role==2) && $site->registerstatus==1}
	<tr>
		<th title="Not public">Invites:</th>
		<td>{$user.invites} 
		{if $user.invites > 0}
			[<a id="lnkSendInvite" onclick="return false;" href="#">Send Invite</a>]
			<span title="Your invites will be reduced when the invitation is claimed." class="invitesuccess" id="divInviteSuccess">Invite Sent</span>
			<span class="invitefailed" id="divInviteError"></span>
			<div style="display:none;" id="divInvite">
				<form id="frmSendInvite" method="GET">
					<label for="txtInvite">Email</label>:
					<input type="text" id="txtInvite" />
					<input type="submit" value="Send"/>
				</form>
			</div>
		{/if}
		</td>
	</tr>
	{/if}
	
	{if $userinvitedby && $userinvitedby.username != ""}
	<tr><th>Invited By:</th><td><a title="View {$userinvitedby.username}'s profile" href="{$smarty.const.WWW_TOP}/profile?name={$userinvitedby.username}">{$userinvitedby.username}</a></td>
	{/if}
	
	<tr><th>UI Preferences:</th>
		<td>
			{if $user.movieview == "1"}View movie covers{else}View standard movie category{/if}<br/>
			{if $user.musicview == "1"}View music covers{else}View standard music category{/if}<br/>
			{if $user.consoleview == "1"}View console covers{else}View standard console category{/if}<br/>
			{if $user.bookview == "1"}View book covers{else}View standard book category{/if}
		</td>
	</tr>
	{if $user.ID==$userdata.ID || $userdata.role==2}<tr><th title="Not public">Excluded Categories:</th><td>{$exccats|replace:",":"<br/>"}</td></tr>{/if}
	{if $page->site->sabintegrationtype == 2 && $user.ID==$userdata.ID}
		<tr><th>SABnzbd Integration:</th>
		<td>
			Url: {if $saburl == ''}N/A{else}{$saburl}{/if}<br/>
			Key: {if $sabapikey == ''}N/A{else}{$sabapikey}{/if}<br/>
			Type: {if $sabapikeytype == ''}N/A{else}{$sabapikeytype}{/if}<br/>
			Priority: {if $sabpriority == ''}N/A{else}{$sabpriority}{/if}<br/>
			Storage: {if $sabsetting == ''}N/A{else}{$sabsetting}{/if}
		</td>
	{/if}
	
	{if ($user.ID==$userdata.ID)}
	<tr>
	   <th>NZBVortex</th>
        <td>
            API key: {$user.nzbvortex_api_key}
            <br />
            Server URL: <a href="{$user.nzbvortex_server_url}" target="_blank">{$user.nzbvortex_server_url}</a>
        </td>
    </tr>
	{/if}

	{if $user.ID==$userdata.ID}
			<tr><th>My TV Shows:</th><td><a href="{$smarty.const.WWW_TOP}/myshows">Manage my shows</a></td></tr>
			<tr><th>My Movies:</th><td><a href="{$smarty.const.WWW_TOP}/mymovies">Manage my movies</a></td></tr>
	{/if}
	
	
	{if $user.ID==$userdata.ID}<tr><th></th><td><a href="{$smarty.const.WWW_TOP}/profileedit">Edit</a></td></tr>{/if}
</table>


{if $userdata.role==2 && $downloadlist|@count > 0}
<div style="padding-top:20px;">
	<h2>Downloads for User and Host</h2>

	<table style="margin-top:10px;" class="data">

		<tr>
			<th>date</th>
			<th>hosthash</th>
			<th>release</th>
		</tr>
		
		{foreach from=$downloadlist item=download}
		{if $download@iteration == 10}
			<tr class="more"><td colspan="3"><a onclick="$('tr.extra').toggle();$('tr.more').toggle();return false;" href="#">show all...</a></td></tr>
		{/if}
		<tr {if $download@iteration >= 10}class="extra" style="display:none;"{/if}>
			<td width="80" title="{$download.timestamp}">{$download.timestamp|date_format}</td>
			<td title="{$download.hosthash}">{if $download.hosthash == ""}n/a{else}{$download.hosthash|truncate:10}{/if}</td>
			<td>{if $download.guid == ""}n/a{else}<a href="{$smarty.const.WWW_TOP}/details/{$download.guid}/{$download.searchname|escape:"seourl"}">{$download.searchname}</a>{/if}</td>
		</tr>
		{/foreach}
	</table>
</div>
{/if}

{if $commentslist|@count > 0}
<div style="padding-top:20px;">
	<a id="comments"></a>
	<h2>Comments</h2>

	{$pager}

	<table style="margin-top:10px;" class="data Sortable">

		<tr>
			<th>date</th>
			<th>release</th>
			<th>comment</th>
		</tr>

		
		{foreach from=$commentslist item=comment}
		<tr>
			<td width="80" title="{$comment.createddate}">{$comment.createddate|date_format}</td>
			<td><a href="{$smarty.const.WWW_TOP}/details/{$comment.guid}/{$comment.searchname|escape:"seourl"}">{$comment.searchname}</a></td>
			<td>{$comment.text|escape:"htmlall"|nl2br}</td>
		</tr>
		{/foreach}
	</table>
</div>
{/if}