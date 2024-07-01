var globals = {
	identifier: 'endpoint',
	selectednodes: [],
	currentnode: undefined,
	workflowname: 'UNTITLED Workflow',
	id: 0,
	routeid: "job_" + new Date().getTime(),
	conmap: {},
	errors: [],
	mode: "",
	kbases: [],
	kbasename: "",
	viewType: "source-view"
	
};

pl = /\+/g,  // Regex for replacing addition symbol with a space
	search = /([^&=]+)=?([^&]*)/g,
	decode = function(s) { return decodeURIComponent(s.replace(pl, " ")); },
	query = window.location.search.substring(1);
globals.mode = query.split("=")[1]

var zTreeObj;
var zTreeObj2;

$(document).ready(function() {

	"use strict";

	getAllConnections();

	$('.icon-level-down').on('click', function() {
		zTreeObj.expandAll(true);
	});

	$('.icon-level-up').on('click', function() {
		zTreeObj.expandAll(false);
	});
});

function update_tree(name) {
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	var treeObj2 = $.fn.zTree.getZTreeObj("treeDemo2");
	var nodes = treeObj.getNodes()[9]
	var nodes2 = treeObj2.getNodes()[0]
	console.log(nodes2)
	var newNode = {
		"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
		"parent": null,
		"type": "kbase",
		"itemType": "component",
		"name": name,
		"data": {
			"config": {
				"name": name,
				"host": "",
				"path": "rcgbucket",
				"user": "",
				"pwd": "",
				"type": "kbase",
				"port": "",
				"clazz": "source",
			}
		},
		"schema": null
	};

	globals.kbases.push(newNode);

	treeObj.refresh();

	treeObj.addNodes(nodes, newNode);
	treeObj2.addNodes(nodes2, newNode);

	treeObj.refresh()
	treeObj2.refresh()
}

function getAllConnections() {
	$.ajax({
		url: "/getConnections/" + "name",
		success: function(result) {

			$('#treeloading').hide();
			$('#treeloading1').hide();
			$("#treeDemo").show();

			var zNodes = JSON.parse(result);
			var setting = {
				callback: {
					onRightClick: myOnRightClick,
					onDblClick: myOnDoubleClick
				}
			};

			console.log(JSON.stringify(zNodes[0]))

			zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
			zTreeObj.expandAll(false);

			zTreeObj3 = $.fn.zTree.init($("#treeDemo3"), setting, [{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"parent": "",
				"type": "kbase",
				"data": {
					"config": {
						"name": "",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "parent",
						"port": "",
						"clazz": "source",
					}
				},
				"itemType": "component",
				"name": "Chains",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "chain",
						"itemType": "component",
						"name": "Simple RAG",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "Simple RAG",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "chain",
								"port": "",
								"clazz": "source"
							}
						},

					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "chain",
						"itemType": "component",
						"name": "MultiQuery RAG",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "MultiQuery RAG",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "chain",
								"port": "",
								"clazz": "source"
							}
						},

					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "chain",
						"itemType": "component",
						"name": "Fusion RAG",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "Fusion RAG",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "chain",
								"port": "",
								"clazz": "source"
							}
						},

					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "chain",
						"itemType": "component",
						"name": "PII RAG",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "PII RAG",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "chain",
								"port": "",
								"clazz": "source"
							}
						},

					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "chain",
						"itemType": "component",
						"name": "Metadata RAG",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "Metadata RAG",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "chain",
								"port": "",
								"clazz": "source"
							}
						},

					}
				],
				"schema": null
			}

			]);

			zTreeObj2 = $.fn.zTree.init($("#treeDemo2"), setting, [{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"parent": "",
				"type": "kbase",
				"data": {
					"config": {
						"name": "",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "knowledgebase",
						"port": "",
						"clazz": "source",
					}
				},
				"itemType": "component",
				"name": "KnowledgeBase",
				"children": [

				],
				"schema": null
			},

			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "PHI Filter",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "filter",
								"port": "",
								"clazz": "source"
							}
						},

					},
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "PII Filter",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "filter",
								"port": "",
								"clazz": "source"
							}
						},

					}
				],
				"parent": null,
				"type": "index",
				"itemType": "component",
				"name": "Filters",
				"data": null,
				"schema": null
			},
			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"parent": "",
				"type": "deployments",
				"data": {
					"config": {
						"name": "",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "deploy",
						"port": "",
						"clazz": "source",
					}
				},
				"itemType": "component",
				"name": "Deployments",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": "",
						"type": "kbase",
						"data": {
							"config": {
								"name": "",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "knowledgebase",
								"port": "",
								"clazz": "source",
							}
						},
						"itemType": "component",
						"name": "Azure (rcg-enableai)",
						"schema": null
					}
				],
				"schema": null
			}]);
			zTreeObj2.expandAll(false);


			zTreeObj1 = $.fn.zTree.init($("#treeDemo1"), setting, [{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Insurance Agent",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Financial Services",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Bank Teller",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Hospitality",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Medical Professional",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Hospitality (Food & Beverage)",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"parent": null,
						"type": "prompt",
						"itemType": "component",
						"name": "Hospitality (Entertainment)",
						"data": {
							"config": {
								"name": "Prompt Template",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "prompt",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					}
				],
				"parent": null,
				"type": "prompt",
				"itemType": "component",
				"name": "Prompt",
				"data": null,
				"schema": null
			},
			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"text": "Azure	",
						"children": [
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"name": "Azure Search Retriever",
								"data": {
									"config": {
										"name": "Azure Search Retriever",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "AzureSearch",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							}
						],
						"parent": null,
						"type": "retriever",
						"itemType": "component",
						"name": "Azure",
						"data": {
							"config": {
								"name": "Azure",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "retriever",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"children": [
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"name": "MultiQuery Retriever",
								"data": {
									"config": {
										"name": "MultiQuery Retriever",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "retriever",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"name": "Vector Store Retriever",
								"data": {
									"config": {
										"name": "Vector Store Retriever",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "retriever",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},

							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"name": "MultiVector Retriever",
								"data": {
									"config": {
										"name": "Vector Store Retriever",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "retriever",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},


							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"iconCls": "source",
								"name": "Parent Document Retriever",
								"data": {
									"config": {
										"name": "Parent Document Retriever",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "retriever",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"name": "Self Querying Retriever",
								"data": {
									"config": {
										"name": "Self Querying Retriever",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "retriever",
										"port": "",
										"clazz": "source",
										}
									}
								},
								"schema": null
							}
						],
						"opened": null,
						"parent": null,
						"type": "retriever",
						"itemType": "component",
						"name": "LangChain",
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "LangChain",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},


					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"children": [
							{
								"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
								"parent": null,
								"type": "retriever",
								"itemType": "component",
								"name": "FAISS",
								"data": null,
								"schema": null
							}],
						"parent": null,
						"type": "retriever",
						"itemType": "component",
						"name": "FAISS",
						"data": null,
						"schema": null
					}

				],
				"parent": null,
				"type": "retriever",
				"itemType": "component",
				"name": "Retrievers",
				"data": null,
				"schema": null
			},


			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "Azure Document Intelligence",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "az_doc_intel",
								"port": "",
								"clazz": "source"
							}
						},
					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "Text Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "TextLoader",
								"port": "",
								"clazz": "source"
							}
						},

					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,

						"type": "index",
						"itemType": "component",
						"name": "PDF Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "PDFLoader",
								"port": "",
								"clazz": "source"
							}
						},
					}
					, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,

						"type": "index",
						"itemType": "component",
						"name": "Unstructured Markdown Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "mdLoader",
								"port": "",
								"clazz": "source"
							}
						},
					}
					, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,

						"type": "index",
						"itemType": "component",
						"name": "JSON Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "JSONLoader",
								"port": "",
								"clazz": "source"
							}
						},
					}
					, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,

						"type": "index",
						"itemType": "component",

						"name": "Unstructured HTML Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "HTMLLoader",
								"port": "",
								"clazz": "source"
							}
						},
					}

					, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",

						"itemType": "component",
						"name": "Directory Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "DirectoryLoader",
								"port": "",
								"clazz": "source"
							}
						},
					}

					, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,

						"type": "index",
						"itemType": "component",
						"name": "CSV Loader",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "CSVLoader",
								"port": "",
								"clazz": "source"
							}
						},
					}
				],
				"parent": null,
				"type": "index",
				"itemType": "component",
				"name": "Document Loaders",
				"data": null,
				"schema": null
			},

			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "Azure Search",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "az_doc_intel",
								"port": "",
								"clazz": "source"
							}
						},
					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "FAISS",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "faiss",
								"port": "",
								"clazz": "source"
							}
						},

					}
					, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "AWS OpenSearch",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "faiss",
								"port": "",
								"clazz": "source"
							}
						},

					},
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "AWS Kendra",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "faiss",
								"port": "",
								"clazz": "source"
							}
						},

					}
				],
				"parent": null,
				"type": "index",
				"itemType": "component",
				"name": "Indexers",
				"data": null,
				"schema": null
			},


			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "PHI Filter",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "filter",
								"port": "",
								"clazz": "source"
							}
						},

					},
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "index",
						"itemType": "component",
						"name": "PII Filter",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "LangChain",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "filter",
								"port": "",
								"clazz": "source"
							}
						},

					}
				],
				"parent": null,
				"type": "index",
				"itemType": "component",
				"name": "Filters",
				"data": null,
				"schema": null
			},

			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"text": "amazon-s3",
				"children": [
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"text": "Azure OpenAI 2",
						"children": [
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "GPT-4 turbo",
								"data": {
									"config": {
										"name": "GPT-4 turbo",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "model",
										"port": "",
										"clazz": "source",
										}
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "GPT-4",
								"data": {
									"config": {
										"name": "GPT-4",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "model",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "GPT-3.5 turbo",
								"data": {
									"config": {
										"name": "GPT-3.5 turbo",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "model",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "GPT-3.5",
								"data": {
									"config": {
										"name": "GPT-3.5",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "model",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							}
						],
						"parent": null,
						"type": "model",
						"itemType": "component",
						"name": "Azure OpenAI",
						"data": {
							"config": {
								"name": "Azure OpenAI",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "Azure OpenAI",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"children": [
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,

								"children": [
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Titan Text G1 - Express",
										"data": {
											"config": {
												"name": "Titan Text G1 - Express",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "TitanText G1Express",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Titan Text G1 - Lite",
										"data": {
											"config": {
												"name": "Titan Text G1 - Lite",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "TitanTextG1Lite",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Titan Text Premier",
										"data": {
											"config": {
												"name": "Titan Text Premier",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "TitanTextPremier",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									}
								],


								"type": "model",
								"itemType": "component",
								"name": "Amazon",
								"data": {
									"config": {
										"name": "Amazon",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "Amazon",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},

							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"children": [
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Claude 2.1",
										"data": {
											"config": {
												"name": "Claude",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "anthropic",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Claude 3 Sonnet",
										"data": {
											"config": {
												"name": "Claude 3 Sonnet",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "Claude3Sonnet",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Claude 3 Haiku",
										"data": {
											"config": {
												"name": "Claude 3 Haiku",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "Claude3Haiku",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},

									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Claude 3 Opus",
										"data": {
											"config": {
												"name": "Claude 3 Opus",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "Claude3Opus",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},

								],
								"type": "model",
								"itemType": "component",
								"name": "Anthropic",
								"data": {
									"config": {
										"name": "Anthropic",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "Anthropic",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"children": [
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Command",
										"data": {
											"config": {
												"name": "Command",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "Command",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},

									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"parent": null,
										"type": "model",
										"itemType": "component",
										"name": "Command Lite",
										"data": {
											"config": {
												"name": "Command Lite",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "CommandLite",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},

								],
								"type": "model",
								"itemType": "component",
								"name": "Meta",
								"data": {
									"config": {
										"name": "Amazon",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "Amazon",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},

							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"children": [
									{
										"id": "da490989-0924-43c2-9203-1f4bb64956d9",
										"type": "model",
										"itemType": "component",
										"name": "Azure OpenAI / Document Intelligence",
										"data": {
											"config": {
												"name": "Azure OpenAI / Document Intelligence",
												"host": "",
												"path": "rcgbucket",
												"user": "",
												"pwd": "",
												"type": "AzureOpenAIDocumentIntelligence",
												"port": "",
												"clazz": "source"
											}
										},
										"schema": null
									},


								],
								"type": "model",
								"itemType": "component",
								"name": "Cohere",
								"data": {
									"config": {
										"name": "Cohere",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "Cohere",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							}
						],
						"parent": null,
						"type": "model",
						"itemType": "component",
						"name": "AWS Bedrock",
						"data": {
							"config": {
								"name": "AWS Bedrock",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "AWSBedrock",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					},
					{
						"id": "da490989-0924-43c2-9203-1f4bb64956d9",
						"children": [
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "Gemini 1.5 Pro (Preview only)",
								"data": {
									"config": {
										"name": "Amazon Lex",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "AmazonLex",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "Gemini 1.0 Pro Vision",
								"data": {
									"config": {
										"name": "Amazon Lex",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "AmazonLex",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							},
							{
								"id": "da490989-0924-43c2-9203-1f4bb64956d9",
								"parent": null,
								"type": "model",
								"itemType": "component",
								"name": "Gemini 1.0 Pro",
								"data": {
									"config": {
										"name": "Amazon Lex",
										"host": "",
										"path": "rcgbucket",
										"user": "",
										"pwd": "",
										"type": "AmazonLex",
										"port": "",
										"clazz": "source"
									}
								},
								"schema": null
							}


						],
						"parent": null,
						"type": "model",
						"itemType": "component",
						"name": "Google Gemini",
						"data": {
							"config": {
								"name": "Google Gemini",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "Gemini",
								"port": "",
								"clazz": "source"
							}
						},
						"schema": null
					}
				],
				"parent": null,
				"type": "model",
				"itemType": "component",
				"name": "Language Models",
				"data": null,
				"schema": null
			},

			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"data": {
							"config": {
								"name": "Azure Blob Storage",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "azure_blob",
								"port": "",
								"clazz": "source",
							}
						},
						"parent": null,
						"type": "storage",
						"itemType": "component",
						"name": "Azure Blob Storage",
						"schema": null
					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "storage",
						"itemType": "component",
						"name": "Google Cloud Storage",
						"data": {
							"config": {
								"name": "Google Cloud Storage",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "GCS",
								"port": "",
								"clazz": "source",
							}
						},
						"schema": null
					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "storage",
						"itemType": "component",
						"name": "Amazon S3",
						"data": {
							"config": {
								"name": "Amazon S3",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "aws_s3",
								"port": "",
								"clazz": "source",
							}
						},
						"schema": null
					}, {
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "storage",
						"itemType": "component",
						"name": "File System Storage",
						"data": {
							"config": {
								"name": "File System Storage",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "filesystem",
								"port": "",
								"clazz": "source",
							}
						},
						"schema": null,
						"data": {
							"config": {
								"name": "File System Storage",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "filesystem",
								"port": "",
								"clazz": "source",
							}
						},
					}
				],
				"parent": null,
				"type": "storage",
				"itemType": "component",
				"name": "Storage",
				"data": null,
				"schema": null,
				"data": {
					"config": {
						"name": "Storage",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "storage",
						"port": "",
						"clazz": "source",
					}
				},
			},
			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [


					/**String output parser
					HTTP Response Output Parser
					JSON Output Functions Parser
					List parser
					Custom list parser
					Datetime parser
					OpenAI Tools
					Auto-fixing parser
					Structured output parser
					XML output parser */




				],
				"parent": null,
				"type": "aws-s3",
				"itemType": "component",
				"name": "Output",
				"data": null,
				"schema": null,
				"data": {
					"config": {
						"name": "Output",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "Output",
						"port": "",
						"clazz": "source",
					}
				},
			},
			{
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				"children": [
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "tool",
						"itemType": "component",
						"name": "SQL Databse Tool",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "v",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "tool",
								"port": "",
								"clazz": "source",
							}
						},
					},
					{
						"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
						"parent": null,
						"type": "tool",
						"itemType": "component",
						"name": "Tavily Search Tool",
						"data": null,
						"schema": null,
						"data": {
							"config": {
								"name": "Tavily Search Tool",
								"host": "",
								"path": "rcgbucket",
								"user": "",
								"pwd": "",
								"type": "tool",
								"port": "",
								"clazz": "source",
							}
						},
					}
				],
				"parent": null,
				"type": "aws-s3",
				"itemType": "component",
				"name": "Tools",
				"data": null,
				"schema": null,
				"data": {
					"config": {
						"name": "Tools",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "Tools",
						"port": "",
						"clazz": "source",
					}
				},
			}, {
				"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
				/**String output parser
		HTTP Response Output Parser
		JSON Output Functions Parser
		List parser
		Custom list parser
		Datetime parser
		OpenAI Tools
		Auto-fixing parser
		Structured output parser
		XML output parser */
				"parent": null,
				"children": [{
					"id": "9bf981dc-4b7c-444e-9958-d5273541d359",
					"parent": "",
					"type": "kbase",
					"data": {
						"config": {
							"name": "",
							"host": "",
							"path": "rcgbucket",
							"user": "",
							"pwd": "",
							"type": "knowledgebase",
							"port": "",
							"clazz": "source",
						}
					},
					"itemType": "component",
					"name": "demo_kb",
					"schema": null
				}],
				"type": "aws-s3",
				"itemType": "component",
				"name": "Knowledge Base",
				"data": null,
				"schema": null,
				"data": {
					"config": {
						"name": "Knowledge Base",
						"host": "",
						"path": "rcgbucket",
						"user": "",
						"pwd": "",
						"type": "kbase",
						"port": "",
						"clazz": "source",
					}
				},
			}

			]);



			zTreeObj1.expandAll(false);

			$(".node_name").draggable({
				helper: 'clone',
				drag: function(event, ui) {
				},
				stop: function(event, ui) {
				},
				start: function(event, ui) {

					var nodeId = $(event)[0].currentTarget.id;
					nodeId = nodeId.substring(0, nodeId.length - 5);
					globals.currentnode = zTreeObj.getNodeByParam('tId', nodeId);

					if (globals.currentnode) {
						zTreeObj.selectNode(globals.currentnode);
					} else {
						globals.currentnode = zTreeObj1.getNodeByParam('tId', nodeId);
						zTreeObj1.selectNode(globals.currentnode);
					}

					if (!globals.currentnode) {
						globals.currentnode = zTreeObj2.getNodeByParam('tId', nodeId);
						zTreeObj2.selectNode(globals.currentnode);
					}

					console.log(globals.currentnode);
				}
			});

			$('#canvas, #canvas2').droppable({
				drop: function(event, ui) {

					if (ui.draggable[0].className.indexOf('node_name') == -1)
						return false;

					var node = globals.currentnode;

					var wrapper = $(this).parent();
					var parentOffset = wrapper.offset();
					var relX = event.pageX - parentOffset.left + wrapper.scrollLeft();
					var relY = event.pageY - parentOffset.top + wrapper.scrollTop();


					var nodeKey = ((node.parent) ? node.parent.replace(/\\/g, "/") : "") + node.name + "|" + node.data.config.host + "|" + node.data.config.type;

					console.log(node);
					console.log(nodeKey);

					addNode(node, nodeKey, relX, relY);
				}
			});

			function myOnRightClick(event, treeId, treeNode) {

				console.log(treeNode);

				var menu5 = [
					{
						'Preview': {
							onclick: function(menuItem, menu) {
								$(".context-menu").hide();
								$(".context-menu-shadow").hide();
								$.ajax({
									url: "/watch/name/",
									type: "POST",
									contentType: "application/json; charset=utf-8",
									dataType: "json",
									data: JSON.stringify({ uri: treeNode.parent + treeNode.name }),
									success: function(result) {

										console.log(treeNode.parent + treeNode.name);
									},
									error: function(XMLHttpRequest, textStatus, errorThrown) {
										console.log("Status: " + textStatus);
										console.log("Error: " + errorThrown);
									}
								});

								return false;
							},
							icon: '/img/eye.png'
						}
					}, , $.contextMenu.separator, {
						'Properties': {
							onclick: function(menuItem, menu) {
								$.each(instance.getConnections(), function(idx, connection) {
									instance.detach(connection);
								});
								$(".context-menu").hide();
								$(".context-menu-shadow").hide();
								return false;
							},
							icon: '/img/detach_icon.png'
						}
					}];

				$("#" + treeNode.tId + "_span").contextMenu(menu5, {
					theme: 'vista',
					beforeShow: function() {
						var targetmenuid = $(this)[0].target.id;
						$(".context-menu-shadow").hide();
						//globals.currentnode = getNode(targetmenuid);
					},
					afterShow: function() {
						$(".context-menu-shadow").hide();
						//globals.currentnode = getNode(targetmenuid);
					}
				});

			}

			function myOnDoubleClick(event, treeId, treeNode) {
				console.log(treeNode);

				var wrapper = $("#canvas").parent();
				var parentOffset = wrapper.offset();
				var relX = event.pageX - parentOffset.left + wrapper.scrollLeft();
				var relY = event.pageY - parentOffset.top + wrapper.scrollTop();
				var node = treeNode;

				var nodeKey = ((node.parent) ? node.parent.replace(/\\/g, "/") : "") + node.name + "|" + node.data.config.host + "|" + node.data.config.type;

				console.log(node);
				console.log(nodeKey);

				addNode(node, nodeKey);

			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			console.log("Status: " + textStatus);
			console.log("Error: " + errorThrown);
		}
	});

	function addNode(node, nodeKey, relX, relY) {

		$.ajax({
			url: "/getMetadata/" + "name",
			type: "POST",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			data: "{\"key\": \"" + nodeKey.toLowerCase() + "\"}",
			success: function(result) {


				var metadata = JSON.parse(result);


				if (metadata[0]) {
					console.log(metadata[0].data);
					if (!node.schema) {
						node.schema = JSON.parse(metadata[0].data);
					}
				}

				$.ajax({
					url: '/getOptions/' + node.data.config.type,
					success: function(result) {
						var options = JSON.parse(result);
						var rows = [], advanced = [];
						$.each(options, function(index, elem) {
							var row = {
								name: elem.name,
								value: '',
								group: 'Options',
								editor: elem.editor
							};
							rows.push(row);
						});

						node.options = rows;
						node.advanced = advanced;
						node.uid = globals.identifier + globals.id

						if (!node.data || node.itemType == 'host') {
							$.messager.alert('Alert', 'cannot add <b>' + node.text + '</b> to the workflow');
							return;
						}

						saveNode(globals.id, globals.identifier + globals.id, node);
						addConnection(relX, relY, node, globals.id);
						globals.id++;
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						console.log("Status: " + textStatus);
						console.log("Error: " + errorThrown);
					}
				});
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				console.log("Status: " + textStatus);
				console.log("Error: " + errorThrown);
			}
		});
	}
}
