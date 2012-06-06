{* Class *}
<div class="block">
    <label>{'Class'|i18n( 'design/admin/workflow/eventtype/edit' )}:</label>
    <select name="WorkflowEvent_event_hideuntildate_class_{$event.id}[]">
    {* Workflow kernel file does not allow custom variables to be passed, so we will get the selected class from the post variable *}
    {def $hideUntilDateSelectedClasses = ezhttp( concat('WorkflowEvent_event_hideuntildate_class_', $event.id ) )}
    {if $hideUntilDateSelectedClasses}
        {def $hideUntilDateSelectedClass = $hideUntilDateSelectedClasses[0]}
    {/if}
    {section var=Classes loop=$event.workflow_type.contentclass_list}
        {section show=and( and( is_set( $hideUntilDateSelectedClass ), $hideUntilDateSelectedClass ), eq( $hideUntilDateSelectedClass, $Classes.item.id ) )}
		<option value="{$Classes.item.id}" selected=true>{$Classes.item.name|wash}</option>
        {section-else}
                <option value="{$Classes.item.id}">{$Classes.item.name|wash}</option>
	{/section}
    {/section}
    </select>
    <input class="button" type="submit" name="CustomActionButton[{$event.id}_load_class_attribute_list]" value="{'Update attributes'|i18n( 'design/admin/workflow/eventtype/edit' )}" />
</div>


{* Attributes *}
{section show=$event.workflow_type.has_class_attributes}
<div class="block">
    {let possibleClassAttributes=$event.workflow_type.contentclassattribute_list}
    <label>{'Attribute'|i18n( 'design/admin/workflow/eventtype/edit' )}:</label>
    <select name="WorkflowEvent_event_hideuntildate_classattribute_{$event.id}[]">
    {section name=HasClassAttributes loop=$possibleClassAttributes}
        <option value="{$HasClassAttributes:item.id}">{$HasClassAttributes:item.name|wash}</option>
    {/section}
    </select>
    {/let}
    <input class="button" type="submit" name="CustomActionButton[{$event.id}_new_classelement]" value="{'Select attribute'|i18n( 'design/admin/workflow/eventtype/edit' )}" />
</div>
{/section}


{* Class/attribute list *}
<div class="block">
<label>{'Class/attribute combinations [%count]'|i18n( 'design/admin/workflow/eventtype/edit',, hash( '%count', $event.content.entry_list|count ) )}:</label>
{section show=$event.content.entry_list}
<table class="list" cellspacing="0">
<tr>
<th class="tight">&nbsp;</th>
<th>{'Class'|i18n( 'design/admin/workflow/eventtype/edit' )}</th>
<th>{'Attribute'|i18n( 'design/admin/workflow/eventtype/edit' )}</th>
</tr>
{section var=Entries loop=$event.content.entry_list sequence=array( bglight, bgdark )}
<tr class="{$Entries.sequence}">
<td><input type="checkbox" name="WorkflowEvent_data_hideuntildate_remove_{$event.id}[]" value="{$Entries.item.id}" /></td>
<td>{$Entries.item.class_name}</td>
<td>{$Entries.item.classattribute_name}</td>
</tr>
{/section}
</table>
{section-else}
<p>{'There are no combinations'|i18n( 'design/admin/workflow/eventtype/edit' )}</p>
{/section}
<div class="controlbar">
<input class="button" type="submit" name="CustomActionButton[{$event.id}_remove_selected]" value="{'Remove selected'|i18n( 'design/admin/workflow/eventtype/edit' )}" {section show=$event.content.entry_list|not}disabled="disabled"{/section} />
</div>
</div>


{* Modify publishing dates *}
<div class="block">
<label>{"Modify the objects' publishing dates"|i18n( 'design/admin/workflow/eventtype/edit' )}:</label>
<input type="checkbox" name="WorkflowEvent_data_hideuntildate_modifydate_{$event.id}[]" value="1" {section show=$event.data_int1}checked="checked"{/section} />
</div>

