 
<h1>{$page->title}</h1>

<p>
	Binaries can be prevented from being added to the index at all if they match a regex provided in the blacklist. They can also be included only if they match a regex (whitelist).
</p>

<div id="message"></div>

<table style="margin-top:10px;" class="data Sortable highlight">

	<tr>
		<th style="width:20px;">id</th>
		<th>group</th>
		<th>regex</th>
		<th class="mid">type</th>
		<th class="mid">field</th>
		<th class="mid">status</th>
		<th class="mid">Options</th>
	</tr>
	
	{foreach from=$binlist item=bin}
	<tr id="row-{$bin.ID}" class="{cycle values=",alt"}">
		<td>{$bin.ID}</td>
		<td title="{$bin.description}">{$bin.groupname|replace:"alt.binaries":"a.b"}</td>
		<td>
			{$bin.regex|escape:html}<br>
			<i>{$bin.description}</i>
		</td>
		<td>{if $bin.optype==1}black{else}white{/if}</td>
		<td>{if $bin.msgcol==1}subject{elseif $bin.msgcol==2}poster{else}messageid{/if}</td>
		<td>{if $bin.status==1}active{else}disabled{/if}</td>
		<td style="width:255px;white-space: nowrap;"><a href="{$smarty.const.WWW_TOP}/binaryblacklist-edit.php?id={$bin.ID}">edit</a> | <a href="javascript:ajax_binaryblacklist_delete({$bin.ID})">delete</a></td>
	</tr>
	{/foreach}

</table>
