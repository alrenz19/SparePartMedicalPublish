<%@ Page Title="Stock IN" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="StockIn.aspx.cs"
    Inherits="QlyMain.Stock.StockIn" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom: 16px;">
            <asp:Literal ID="litMsg" runat="server" />
        </div>
    </asp:Panel>
    
    <div style="display: grid; grid-template-columns: 420px 1fr; gap: 20px; align-items: start;">
        <!-- Left Panel - Stock In Form -->
        <div class="card">
            <div class="card-header">
                <span class="card-title">
                    <i class="fa-solid fa-arrow-down-to-line"></i> Stock IN
                </span>
            </div>
            <div class="card-body">
                <!-- Process Filter Dropdown - Client Side Only -->
                <div class="form-group">
                    <label class="form-label">Filter by Process</label>
                    <asp:DropDownList ID="ddlProcessFilter" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">-- All Processes --</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <!-- Spare Part Selection with Autocomplete -->
                <div class="form-group">
                    <label class="form-label">Spare Part *</label>
                    <div style="position: relative;">
                        <asp:TextBox ID="txtSparePart" runat="server" CssClass="form-control" 
                            placeholder="Type at least 2 characters to search..." 
                            autocomplete="off" />
                        <div id="sparePartSuggestions" style="position: absolute; top: 100%; left: 0; right: 0; background: white; border: 1px solid #ddd; border-radius: 4px; max-height: 350px; overflow-y: auto; display: none; z-index: 1000; box-shadow: 0 2px 8px rgba(0,0,0,0.15);"></div>
                    </div>
                    <asp:HiddenField ID="hfPartId" runat="server" />
                    <asp:HiddenField ID="hfPartCode" runat="server" />
                    <asp:HiddenField ID="hfPartName" runat="server" />
                </div>
                
                <!-- Stock Information Panel -->
                <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                    <div style="background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%); border: 1px solid #bae6fd; border-radius: 8px; padding: 12px; margin-bottom: 14px; display: flex; gap: 20px;">
                        <div style="flex: 1; text-align: center;">
                            <div style="font-size: 10px; color: #0369a1; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Current Stock</div>
                            <div style="font-size: 28px; font-weight: 700; color: #0c4a6e;">
                                <asp:Literal ID="litStock" runat="server" />
                            </div>
                        </div>
                        <div style="flex: 1; text-align: center;">
                            <div style="font-size: 10px; color: #0369a1; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Safety Stock</div>
                            <div style="font-size: 22px; font-weight: 700; color: #0c4a6e;">
                                <asp:Literal ID="litSafety" runat="server" />
                            </div>
                        </div>
                        <div style="flex: 1; text-align: center;">
                            <div style="font-size: 10px; color: #0369a1; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Unit</div>
                            <div style="font-size: 20px; font-weight: 600; color: #0c4a6e;">
                                <asp:Literal ID="litUnit" runat="server" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                
                <!-- Quantity and Date -->
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px;">
                    <div class="form-group">
                        <label class="form-label">Quantity *</label>
                        <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" 
                            TextMode="Number" Text="1" Style="font-size: 18px; font-weight: 700; text-align: center;" />
                        <asp:RangeValidator ControlToValidate="txtQty" runat="server" 
                            MinimumValue="1" MaximumValue="999999" Type="Integer" 
                            ErrorMessage="Quantity must be ≥ 1" ForeColor="Red" Display="Dynamic" Font-Size="11px" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Input Date</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                </div>
                
                <!-- Remark -->
                <div class="form-group">
                    <label class="form-label">Remark</label>
                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" 
                        TextMode="MultiLine" Rows="3" placeholder="Source, PO number, reference notes..." />
                </div>
                
                <!-- Buttons -->
                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <asp:Button ID="btnSave" runat="server" Text="Confirm IN" 
                        CssClass="btn btn-success" Style="flex: 1; padding: 10px; font-weight: 600;" 
                        OnClick="BtnSave_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" 
                        CssClass="btn btn-secondary" OnClick="BtnReset_Click" 
                        CausesValidation="false" />
                </div>
            </div>
        </div>
        
        <!-- Right Panel - History -->
        <div class="card">
            <div class="card-header">
                <span class="card-title">
                    <i class="fa-solid fa-clock-rotate-left"></i> Recent Input History (Last 30 Days)
                </span>
                <a href='<%= ResolveUrl("~/AuditTrailPage/InputHistory.aspx") %>' 
                    class="btn btn-secondary btn-sm">View All</a>
            </div>
            <div class="table-wrapper" style="max-height: 500px; overflow-y: auto;">
                <asp:GridView ID="gvHistory" runat="server" CssClass="data-table" 
                    AutoGenerateColumns="false" EmptyDataText="No records found." GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Date" ItemStyle-Width="100">
                            <ItemTemplate>
                                <span style="font-size: 12px; font-family: monospace;">
                                    <%# Eval("InputDate") != null ? ((System.DateTime)Eval("InputDate")).ToString("dd/MM/yyyy") : "-" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ItemCode" HeaderText="Code" ItemStyle-CssClass="font-mono" />
                        <asp:BoundField DataField="PartName" HeaderText="Part Name" />
                        <asp:TemplateField HeaderText="Qty" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <span style="font-weight: 700; color: #16a34a; font-size: 13px;">+<%# Eval("Quantity") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="QuantityInStockBefore" HeaderText="Before" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="QuantityInStockAfter" HeaderText="After" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="CreatedBy" HeaderText="By" ItemStyle-Width="80" />
                        <asp:BoundField DataField="Remark" HeaderText="Remark" />
                    </Columns>
                    <AlternatingRowStyle BackColor="#f8faff" />
                    <EmptyDataRowStyle HorizontalAlign="Center" ForeColor="#6c757d" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        (function () {
            'use strict';

            var sparePartInput, suggestionsDiv, processFilter, hfPartId, hfPartCode, hfPartName;
            var masterSparePartsData = null;
            var searchCache = new Map();
            var currentProcessFilter = '';

            var MIN_SEARCH_LENGTH = 2;
            var MAX_RESULTS = 50;
            var SEARCH_DEBOUNCE_MS = 250;
            var CACHE_MAX_SIZE = 100;

            function init() {
                sparePartInput = document.getElementById('<%= txtSparePart.ClientID %>');
                suggestionsDiv = document.getElementById('sparePartSuggestions');
                processFilter = document.getElementById('<%= ddlProcessFilter.ClientID %>');
                hfPartId = document.getElementById('<%= hfPartId.ClientID %>');
                hfPartCode = document.getElementById('<%= hfPartCode.ClientID %>');
                hfPartName = document.getElementById('<%= hfPartName.ClientID %>');
                
                if (!sparePartInput || !suggestionsDiv) {
                    return;
                }
                
                loadMasterData();
                setupEventListeners();
                setupPostbackHandler();
            }
            
            function loadMasterData() {
                if (window.sparePartsMasterData && window.sparePartsMasterData.length > 0) {
                    masterSparePartsData = window.sparePartsMasterData;
                } else {
                    setTimeout(loadMasterData, 100);
                }
            }
            
            function getFilteredSpareParts() {
                if (!masterSparePartsData) return [];
                
                if (!currentProcessFilter || currentProcessFilter === '') {
                    return masterSparePartsData;
                }
                
                return masterSparePartsData.filter(function(part) {
                    return part.processCode === currentProcessFilter;
                });
            }
            
            function searchSpareParts(searchTerm) {
                if (!masterSparePartsData) return [];
                
                var cacheKey = currentProcessFilter + '|' + searchTerm;
                if (searchCache.has(cacheKey)) {
                    return searchCache.get(cacheKey);
                }
                
                var results = [];
                var filteredData = getFilteredSpareParts();
                
                if (!searchTerm || searchTerm.length < MIN_SEARCH_LENGTH) {
                    results = filteredData.slice(0, MAX_RESULTS);
                } else {
                    var term = searchTerm.toLowerCase().trim();
                    
                    for (var i = 0; i < filteredData.length && results.length < MAX_RESULTS; i++) {
                        var part = filteredData[i];
                        var code = part.code ? part.code.toLowerCase() : '';
                        var name = part.name ? part.name.toLowerCase() : '';
                        
                        if (code.indexOf(term) !== -1 || name.indexOf(term) !== -1) {
                            results.push(part);
                        }
                    }
                }
                
                searchCache.set(cacheKey, results);
                
                if (searchCache.size > CACHE_MAX_SIZE) {
                    var firstKey = searchCache.keys().next().value;
                    searchCache.delete(firstKey);
                }
                
                return results;
            }
            
            function displaySuggestions(parts) {
                if (!suggestionsDiv) return;
                
                suggestionsDiv.innerHTML = '';
                
                if (!parts || parts.length === 0) {
                    var noDataMsg = document.createElement('div');
                    noDataMsg.style.padding = '12px 16px';
                    noDataMsg.style.color = '#6c757d';
                    noDataMsg.style.textAlign = 'center';
                    noDataMsg.style.fontSize = '13px';
                    
                    if (sparePartInput.value.length < MIN_SEARCH_LENGTH) {
                        noDataMsg.innerHTML = 'Type at least 2 characters to search...';
                    } else if (currentProcessFilter) {
                        noDataMsg.innerHTML = 'No parts found in this process';
                    } else {
                        noDataMsg.innerHTML = 'No matching spare parts found';
                    }
                    
                    suggestionsDiv.appendChild(noDataMsg);
                    suggestionsDiv.style.display = 'block';
                    return;
                }
                
                var fragment = document.createDocumentFragment();
                
                for (var i = 0; i < parts.length; i++) {
                    var part = parts[i];
                    var div = document.createElement('div');
                    div.style.padding = '10px 14px';
                    div.style.cursor = 'pointer';
                    div.style.borderBottom = '1px solid #e9ecef';
                    div.style.transition = 'all 0.15s ease';
                    div.style.backgroundColor = (i % 2 === 0) ? '#ffffff' : '#fafbfc';
                    
                    var mainRow = document.createElement('div');
                    mainRow.style.display = 'flex';
                    mainRow.style.justifyContent = 'space-between';
                    mainRow.style.alignItems = 'center';
                    
                    var nameCode = document.createElement('div');
                    nameCode.style.flex = '1';
                    
                    var partName = document.createElement('div');
                    partName.style.fontWeight = '600';
                    partName.style.fontSize = '14px';
                    partName.style.color = '#1a1a2e';
                    partName.innerHTML = escapeHtml(part.name || '');
                    nameCode.appendChild(partName);
                    
                    var partCode = document.createElement('div');
                    partCode.style.fontSize = '11px';
                    partCode.style.color = '#6c757d';
                    partCode.style.fontFamily = 'monospace';
                    partCode.style.marginTop = '3px';
                    partCode.innerHTML = escapeHtml(part.code || '');
                    nameCode.appendChild(partCode);
                    
                    mainRow.appendChild(nameCode);
                    
                    if (part.stock !== undefined && part.stock !== null) {
                        var stockBadge = document.createElement('div');
                        stockBadge.style.backgroundColor = part.stock <= 10 ? '#fee2e2' : '#e0f2fe';
                        stockBadge.style.color = part.stock <= 10 ? '#991b1b' : '#0369a1';
                        stockBadge.style.padding = '2px 8px';
                        stockBadge.style.borderRadius = '12px';
                        stockBadge.style.fontSize = '11px';
                        stockBadge.style.fontWeight = '600';
                        stockBadge.style.whiteSpace = 'nowrap';
                        stockBadge.innerHTML = 'Stock: ' + part.stock;
                        mainRow.appendChild(stockBadge);
                    }
                    
                    div.appendChild(mainRow);
                    
                    div.addEventListener('mouseenter', function(el) {
                        return function() {
                            el.style.backgroundColor = '#e8f0fe';
                            el.style.borderLeft = '3px solid #0d6efd';
                        };
                    }(div));
                    
                    div.addEventListener('mouseleave', function(el, idx) {
                        return function() {
                            el.style.backgroundColor = (idx % 2 === 0) ? '#ffffff' : '#fafbfc';
                            el.style.borderLeft = 'none';
                        };
                    }(div, i));
                    
                    div.addEventListener('click', function(p) {
                        return function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            selectSparePart(p);
                        };
                    }(part));
                    
                    fragment.appendChild(div);
                }
                
                suggestionsDiv.appendChild(fragment);
                suggestionsDiv.style.display = 'block';
            }
            
            function escapeHtml(text) {
                if (!text) return '';
                var div = document.createElement('div');
                div.textContent = text;
                return div.innerHTML;
            }
            
            function selectSparePart(part) {
                if (!part) return;
                
                var displayText = part.name + ' - ' + part.code;
                sparePartInput.value = displayText;
                
                if (hfPartId) hfPartId.value = part.id;
                if (hfPartCode) hfPartCode.value = part.code;
                if (hfPartName) hfPartName.value = part.name;
                
                suggestionsDiv.style.display = 'none';
                
                __doPostBack('<%= hfPartId.ClientID %>', '');
            }

            function updateProcessFilter() {
                if (!processFilter) return;

                currentProcessFilter = processFilter.value;
                searchCache.clear();

                sparePartInput.value = '';
                if (hfPartId) hfPartId.value = '';
                if (hfPartCode) hfPartCode.value = '';
                if (hfPartName) hfPartName.value = '';

                if (sparePartInput.value.length >= MIN_SEARCH_LENGTH) {
                    var results = searchSpareParts(sparePartInput.value);
                    displaySuggestions(results);
                } else if (sparePartInput.value.length === 0) {
                    var results = getFilteredSpareParts().slice(0, 20);
                    displaySuggestions(results);
                }
            }

            var searchTimeout;
            function handleSearchInput() {
                clearTimeout(searchTimeout);

                searchTimeout = setTimeout(function () {
                    var searchTerm = sparePartInput.value;
                    var results = searchSpareParts(searchTerm);
                    displaySuggestions(results);
                }, SEARCH_DEBOUNCE_MS);
            }

            function setupEventListeners() {
                if (processFilter) {
                    processFilter.addEventListener('change', updateProcessFilter);
                }

                sparePartInput.addEventListener('input', handleSearchInput);

                sparePartInput.addEventListener('click', function (e) {
                    e.stopPropagation();
                    if (sparePartInput.value.length >= MIN_SEARCH_LENGTH) {
                        var results = searchSpareParts(sparePartInput.value);
                        displaySuggestions(results);
                    } else if (masterSparePartsData) {
                        var results = getFilteredSpareParts().slice(0, 20);
                        displaySuggestions(results);
                    }
                });

                document.addEventListener('click', function (e) {
                    if (e.target !== sparePartInput && !suggestionsDiv.contains(e.target)) {
                        suggestionsDiv.style.display = 'none';
                    }
                });

                sparePartInput.addEventListener('keydown', function (e) {
                    var items = suggestionsDiv.children;

                    if (e.key === 'ArrowDown') {
                        e.preventDefault();
                        if (suggestionsDiv.style.display === 'block' && items.length > 0) {
                            if (items[0] && items[0].classList) {
                                items[0].classList.add('suggestion-active');
                            }
                        }
                    } else if (e.key === 'Enter') {
                        if (suggestionsDiv.style.display === 'block' && items.length > 0) {
                            e.preventDefault();
                            var activeItem = null;
                            for (var i = 0; i < items.length; i++) {
                                if (items[i].classList && items[i].classList.contains('suggestion-active')) {
                                    activeItem = items[i];
                                    break;
                                }
                            }
                            if (!activeItem) activeItem = items[0];

                            if (activeItem && activeItem.innerText !== 'Type at least 2 characters to search...') {
                                activeItem.click();
                            }
                        }
                    } else if (e.key === 'Escape') {
                        suggestionsDiv.style.display = 'none';
                    }
                });

                sparePartInput.addEventListener('blur', function () {
                    setTimeout(function () {
                        suggestionsDiv.style.display = 'none';
                    }, 200);
                });
            }

            function setupPostbackHandler() {
                if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                    if (prm) {
                        prm.add_beginRequest(function () {
                            if (sparePartInput) {
                                sparePartInput.style.opacity = '0.6';
                            }
                        });

                        prm.add_endRequest(function () {
                            if (sparePartInput) {
                                sparePartInput.style.opacity = '1';
                            }

                            if (window.sparePartsMasterData && masterSparePartsData !== window.sparePartsMasterData) {
                                masterSparePartsData = window.sparePartsMasterData;
                                searchCache.clear();
                            }
                        });
                    }
                }
            }

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', init);
            } else {
                init();
            }
        })();
    </script>
    
    <%-- Server-side data injection --%>
    <asp:Literal ID="litMasterData" runat="server" Visible="false" />
</asp:Content>