<h1>{$page->title}</h1> 

{if $booklist}
{$pager}

<table style="margin-top:10px;" class="data Sortable highlight">

	<tr>
		<th>ID</th>
		<th>Title</th>
		<th>Author</th>
		<th>Created</th>
	</tr>
	
	{foreach from=$booklist item=book}
	<tr class="{cycle values=",alt"}">
		<td class="less">{$book.ID}</td>
		<td><a title="Edit" href="{$smarty.const.WWW_TOP}/book-edit.php?id={$book.ID}">{$book.title}</a></td>
		<td>{$book.author}</td>
		<td>{$book.createddate|date_format}</td>
	</tr>
	{/foreach}

</table>
{else}
<p>No books available.</p>
{/if}
