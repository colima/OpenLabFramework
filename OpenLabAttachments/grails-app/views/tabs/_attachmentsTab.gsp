<gui:tab label="Attachments" cacheData="true">
	<div id="attachmentsTab">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="fileName" title="${message(code: 'dataObjectAttachment.fileName.label', default: 'fileName')}" />
							<g:sortableColumn property="fileUploadDate" title="${message(code: 'dataObjectAttachment.uploadDate.label', default: 'uploaded')}" />
							<g:sortableColumn property="description" title="${message(code: 'dataObjectAttachment.description.label', default: 'description')}" />
							<th>action</th>                
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dataObjectAttachmentInstanceList}" status="i" var="dataObjectAttachmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            <g:attachmentIconWithPlugin type="${dataObjectAttachmentInstance.fileType}"/>
                            <g:link action="download" id="${dataObjectAttachmentInstance.id}">${fieldValue(bean: dataObjectAttachmentInstance, field: "fileName")}</g:link></td>

                            	<td valign="top" class="value">
                            		<g:formatDate date="${dataObjectAttachmentInstance.fileUploadDate}" />
                           		</td>

                            <td>
                         		<g:editInPlace id="description_${dataObjectAttachmentInstance.id}"
									url="[action: 'editField', id: dataObjectAttachmentInstance.id]"
									rows="1"
									cols= "10"
									paramName="description">\${fieldValue(bean: dataObjectAttachmentInstance, field: "description")}
								</g:editInPlace>
							</td>
							
							<td>
								            
            					<g:form controller="dataObjectAttachment" method="post" >
                					<g:hiddenField name="id" value="${dataObjectAttachmentInstance?.id}" />
                					<g:hiddenField name="version" value="${dataObjectAttachmentInstance?.version}" />
									<g:link controller="dataObjectAttachment" action="download" id="${dataObjectAttachmentInstance.id}"><g:attachmentIconWithPlugin type="download"/></g:link> |
									<g:actionSubmit class="edit" action="edit" value="edit"/>								
									<g:actionSubmit class="delete" action="delete" value="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</g:form>
							</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dataObjectAttachmentInstanceTotal}" />
            </div>
        </div>
</gui:tab>
