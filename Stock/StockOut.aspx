<%@ Page Title="Stock OUT" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="StockOut.aspx.cs"
    Inherits="QlyMain.Stock.StockOut" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .required:after {
            content: " *";
            color: red;
            font-weight: bold;
        }
        .error-highlight {
            border-color: red !important;
            background-color: #fff8f8 !important;
        }
        .suggestion-active {
            background-color: #e8f0fe !important;
            border-left: 3px solid #0d6efd !important;
        }
    </style>
    
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom: 16px;">
            <asp:Literal ID="litMsg" runat="server" />
        </div>
    </asp:Panel>
    
    <div style="display: grid; grid-template-columns: 450px 1fr; gap: 20px; align-items: start;">
        <!-- Left Panel - Stock Out Form -->
        <div class="card">
            <div class="card-header">
                <span class="card-title">
                    <i class="fa-solid fa-arrow-up-from-line"></i> Stock OUT
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
                    <label class="form-label">Scan Spare Part QR Code</label>
                    <div style="display: flex; gap: 8px;">
                        <asp:TextBox ID="txtQrScan" runat="server" CssClass="form-control"
                            placeholder="Scan QR code, then press Enter..." autocomplete="off" />
                        <asp:Button ID="btnQrScan" runat="server" Text="Scan"
                            CssClass="btn btn-primary" OnClick="BtnQrScan_Click"
                            CausesValidation="false" />
                    </div>
                    <small style="color: #6c757d;">Use a USB/Bluetooth QR scanner or paste the QR value.</small>
                </div>
                <div class="form-group">
                    <label class="form-label required">Spare Part</label>
                    <div style="position: relative;">
                        <asp:TextBox ID="txtSparePart" runat="server" CssClass="form-control"
                            placeholder="Type to search or scan QR code here..."
                            autocomplete="off" />
                        <div id="sparePartSuggestions" style="position: absolute; top: 100%; left: 0; right: 0; background: white; border: 1px solid #ddd; border-radius: 4px; max-height: 350px; overflow-y: auto; display: none; z-index: 1000; box-shadow: 0 2px 8px rgba(0,0,0,0.15);"></div>
                    </div>
                    <asp:HiddenField ID="hfPartId" runat="server" />
                    <asp:HiddenField ID="hfPartCode" runat="server" />
                    <asp:HiddenField ID="hfPartName" runat="server" />
                </div>
                
                <!-- Stock Information Panel -->
                <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                    <div id="stockBox" runat="server" style="border-radius: 8px; padding: 12px; margin-bottom: 14px; display: flex; gap: 20px;">
                        <div>
                            <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">STOCK</div>
                            <div style="font-size: 26px; font-weight: 700;">
                                <asp:Literal ID="litStock" runat="server" />
                            </div>
                        </div>
                        <div>
                            <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">SAFETY</div>
                            <div style="font-size: 22px; font-weight: 700;">
                                <asp:Literal ID="litSafety" runat="server" />
                            </div>
                        </div>
                        <div>
                            <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">STATUS</div>
                            <asp:Literal ID="litAlert" runat="server" />
                        </div>
                        <div>
                            <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">PROCESS</div>
                            <div style="font-size: 16px; font-weight: 700;"><asp:Literal ID="litProcess" runat="server" /></div>
                        </div>
                    </div>
                </asp:Panel>
                
                <!-- Quantity and Machine ID -->
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px;">
                    <div class="form-group">
                        <label class="form-label required">Quantity</label>
                        <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" 
                            TextMode="Number" Text="1" Style="font-size: 18px; font-weight: 700; text-align: center;" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Machine Code</label>
                        <div style="position: relative;">
                            <asp:TextBox ID="txtMachineCode" runat="server" CssClass="form-control" 
                                placeholder="Type to search machine..." autocomplete="off" />
                            <div id="machineSuggestions" style="position: absolute; top: 100%; left: 0; right: 0; background: white; border: 1px solid #ddd; border-radius: 4px; max-height: 300px; overflow-y: auto; display: none; z-index: 1000; box-shadow: 0 2px 8px rgba(0,0,0,0.15);"></div>
                        </div>
                        <asp:HiddenField ID="hfIdCodeMachine" runat="server" />
                        <asp:HiddenField ID="hfCodeMachine" runat="server" />
                        <asp:HiddenField ID="hfMachineName" runat="server" />
                    </div>
                </div>
                
                <!-- Machine Info Display Panel -->
                <asp:Panel ID="pnlMachineInfo" runat="server" Visible="false">
                    <div id="machineInfoBox" runat="server" style="border-radius: 8px; padding: 12px; margin-bottom: 14px; background: #eff6ff; border: 1px solid #bfdbfe;">
                        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px;">
                            <div style="flex: 1;">
                                <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">MACHINE NAME</div>
                                <div style="font-size: 16px; font-weight: 700; color: #1e40af;">
                                    <asp:Literal ID="litMachineName" runat="server" />
                                </div>
                            </div>
                            <div>
                                <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">MACHINE CODE</div>
                                <div style="font-size: 14px; font-weight: 600; font-family: monospace;">
                                    <asp:Literal ID="litMachineCode" runat="server" />
                                </div>
                            </div>
                            <div>
                                <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">TYPE</div>
                                <div style="font-size: 13px; font-weight: 500;">
                                    <asp:Literal ID="litMachineType" runat="server" />
                                </div>
                            </div>
                            <div>
                                <div style="font-size: 11px; font-weight: 600; opacity: .75; text-transform: uppercase;">DEPARTMENT</div>
                                <div style="font-size: 13px; font-weight: 500;">
                                    <asp:Literal ID="litDepartment" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                
                <!-- Personnel Information -->
                <div class="form-group">
                    <label class="form-label">Output By</label>
                    <asp:TextBox ID="txtOutputBy" runat="server" CssClass="form-control" 
                        placeholder="Person taking out..." ReadOnly="true" Enabled="false" 
                        BackColor="#F5F5F5" />
                </div>
                
                <div class="form-group">
                    <label class="form-label required">Person Receive</label>
                    <asp:TextBox ID="txtPersonReceive" runat="server" CssClass="form-control" 
                        placeholder="Person receiving..." />
                </div>
                
                <!-- Purpose / Status -->
                <div class="form-group">
                    <label class="form-label">Purpose / Status</label>
                    <asp:DropDownList ID="ddlStatusUsing" runat="server" CssClass="form-select">
                        <asp:ListItem>Maintenance</asp:ListItem>
                        <asp:ListItem>Breakdown repair</asp:ListItem>
                        <asp:ListItem>Improvement</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <!-- Remark -->
                <div class="form-group">
                    <label class="form-label required">Remark</label>
                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" 
                        TextMode="MultiLine" Rows="2" />
                </div>
                
                <!-- Buttons -->
                <div style="display: flex; gap: 10px;">
                    <asp:Button ID="btnSave" runat="server" Text="Confirm OUT" 
                        CssClass="btn btn-warning" Style="flex: 1; padding: 10px; font-weight: 600;" 
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
                    <i class="fa-solid fa-clock-rotate-left"></i> Recent Output (30 days)
                </span>
                <a href='<%= ResolveUrl("~/AuditTrailPage/OutputHistory.aspx") %>' 
                    class="btn btn-secondary btn-sm">View All</a>
            </div>
            <div class="table-wrapper" style="max-height: 500px; overflow-y: auto;">
                <asp:GridView ID="gvHistory" runat="server" CssClass="data-table" 
                    AutoGenerateColumns="false" EmptyDataText="No records found." GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Date" ItemStyle-Width="110">
                            <ItemTemplate>
                                <span style="font-size: 12px; font-family: monospace;">
                                    <%# Eval("OutputDate") != null ? ((System.DateTime)Eval("OutputDate")).ToString("dd/MM/yyyy HH:mm") : "-" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Model" HeaderText="Model" ItemStyle-CssClass="font-mono" />
                        <asp:BoundField DataField="PartName" HeaderText="Part Name" />
                        <asp:TemplateField HeaderText="Qty" ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <span style="font-weight: 700; color: #dc2626;">-<%# Eval("Quantity") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OutputBy" HeaderText="By" ItemStyle-Width="80" />
                        <asp:BoundField DataField="PersonReceive" HeaderText="Receive" ItemStyle-Width="80" />
                        <asp:BoundField DataField="StatusUsing" HeaderText="Purpose" />
                        <asp:TemplateField HeaderText="Cost" ItemStyle-Width="80">
                            <ItemTemplate>
                                <span style="font-size: 12px;">
                                    <%# Eval("CostDisplay") != null ? Eval("CostDisplay") : "-" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <AlternatingRowStyle BackColor="#fff8f8" />
                    <EmptyDataRowStyle HorizontalAlign="Center" ForeColor="#6c757d" />
                </asp:GridView>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        (function () {
            'use strict';

            // DOM Elements
            var sparePartInput, spareSuggestionsDiv, processFilter;
            var machineInput, machineSuggestionsDiv;
            var hfPartId, hfPartCode, hfPartName;
            var qrScanInput, qrScanButton;
            var hfMachineId, hfMachineCode, hfMachineName;

            // Data caches
            var masterSparePartsData = null;
            var masterMachinesData = null;
            var spareSearchCache = new Map();
            var machineSearchCache = new Map();
            var currentProcessFilter = '';

            // Configuration
            var MIN_SEARCH_LENGTH = 2;
            var MAX_RESULTS = 50;
            var SEARCH_DEBOUNCE_MS = 250;
            var CACHE_MAX_SIZE = 100;

            function init() {
                // Spare part elements
                sparePartInput = document.getElementById('<%= txtSparePart.ClientID %>');
                spareSuggestionsDiv = document.getElementById('sparePartSuggestions');
                processFilter = document.getElementById('<%= ddlProcessFilter.ClientID %>');
                hfPartId = document.getElementById('<%= hfPartId.ClientID %>');
                hfPartCode = document.getElementById('<%= hfPartCode.ClientID %>');
                hfPartName = document.getElementById('<%= hfPartName.ClientID %>');
                qrScanInput = document.getElementById('<%= txtQrScan.ClientID %>');
                qrScanButton = document.getElementById('<%= btnQrScan.ClientID %>');

                // Machine elements
                machineInput = document.getElementById('<%= txtMachineCode.ClientID %>');
                machineSuggestionsDiv = document.getElementById('machineSuggestions');
                hfMachineId = document.getElementById('<%= hfIdCodeMachine.ClientID %>');
                hfMachineCode = document.getElementById('<%= hfCodeMachine.ClientID %>');
                hfMachineName = document.getElementById('<%= hfMachineName.ClientID %>');
                
                if (!sparePartInput || !spareSuggestionsDiv) return;
                
                loadMasterData();
                setupEventListeners();
                setupFieldListeners();
                setupPostbackHandler();
            }
            
            function loadMasterData() {
                if (window.sparePartsMasterData && window.sparePartsMasterData.length > 0) {
                    masterSparePartsData = window.sparePartsMasterData;
                } else {
                    setTimeout(loadMasterData, 100);
                }
                
                if (window.machinesMasterData && window.machinesMasterData.length > 0) {
                    masterMachinesData = window.machinesMasterData;
                } else {
                    setTimeout(loadMasterData, 100);
                }
            }
            
            // Spare Part Functions
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
                if (spareSearchCache.has(cacheKey)) {
                    return spareSearchCache.get(cacheKey);
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
                
                spareSearchCache.set(cacheKey, results);
                if (spareSearchCache.size > CACHE_MAX_SIZE) {
                    var firstKey = spareSearchCache.keys().next().value;
                    spareSearchCache.delete(firstKey);
                }
                
                return results;
            }
            
            function displaySpareSuggestions(parts) {
                if (!spareSuggestionsDiv) return;
                spareSuggestionsDiv.innerHTML = '';
                
                if (!parts || parts.length === 0) {
                    var noDataMsg = document.createElement('div');
                    noDataMsg.style.padding = '12px 16px';
                    noDataMsg.style.color = '#6c757d';
                    noDataMsg.style.textAlign = 'center';
                    noDataMsg.style.fontSize = '13px';
                    noDataMsg.innerHTML = (sparePartInput.value.length < MIN_SEARCH_LENGTH) ? 
                        'Type at least 2 characters to search...' : 'No spare parts found';
                    spareSuggestionsDiv.appendChild(noDataMsg);
                    spareSuggestionsDiv.style.display = 'block';
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
                        return function() { el.style.backgroundColor = '#e8f0fe'; el.style.borderLeft = '3px solid #0d6efd'; };
                    }(div));
                    
                    div.addEventListener('mouseleave', function(el, idx) {
                        return function() { el.style.backgroundColor = (idx % 2 === 0) ? '#ffffff' : '#fafbfc'; el.style.borderLeft = 'none'; };
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
                
                spareSuggestionsDiv.appendChild(fragment);
                spareSuggestionsDiv.style.display = 'block';
            }
            
            function selectSparePart(part) {
                if (!part) return;
                sparePartInput.value = part.name + ' - ' + part.code;
                if (hfPartId) hfPartId.value = part.id;
                if (hfPartCode) hfPartCode.value = part.code;
                if (hfPartName) hfPartName.value = part.name;
                sparePartInput.classList.remove('error-highlight');
                spareSuggestionsDiv.style.display = 'none';
                __doPostBack('<%= hfPartId.ClientID %>', '');
            }
            
            // Machine Functions
            function searchMachines(searchTerm) {
                if (!masterMachinesData) return [];
                
                if (machineSearchCache.has(searchTerm)) {
                    return machineSearchCache.get(searchTerm);
                }
                
                var results = [];
                if (!searchTerm || searchTerm.length < MIN_SEARCH_LENGTH) {
                    results = masterMachinesData.slice(0, MAX_RESULTS);
                } else {
                    var term = searchTerm.toLowerCase().trim();
                    for (var i = 0; i < masterMachinesData.length && results.length < MAX_RESULTS; i++) {
                        var machine = masterMachinesData[i];
                        var code = machine.code ? machine.code.toLowerCase() : '';
                        var name = machine.name ? machine.name.toLowerCase() : '';
                        if (code.indexOf(term) !== -1 || name.indexOf(term) !== -1) {
                            results.push(machine);
                        }
                    }
                }
                
                machineSearchCache.set(searchTerm, results);
                if (machineSearchCache.size > CACHE_MAX_SIZE) {
                    var firstKey = machineSearchCache.keys().next().value;
                    machineSearchCache.delete(firstKey);
                }
                
                return results;
            }
            
            function displayMachineSuggestions(machines) {
                if (!machineSuggestionsDiv) return;
                machineSuggestionsDiv.innerHTML = '';
                
                if (!machines || machines.length === 0) {
                    var noDataMsg = document.createElement('div');
                    noDataMsg.style.padding = '12px 16px';
                    noDataMsg.style.color = '#6c757d';
                    noDataMsg.style.textAlign = 'center';
                    noDataMsg.style.fontSize = '13px';
                    noDataMsg.innerHTML = 'No machines found';
                    machineSuggestionsDiv.appendChild(noDataMsg);
                    machineSuggestionsDiv.style.display = 'block';
                    return;
                }
                
                var fragment = document.createDocumentFragment();
                for (var i = 0; i < machines.length; i++) {
                    var machine = machines[i];
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
                    
                    var infoDiv = document.createElement('div');
                    infoDiv.style.flex = '1';
                    
                    var codeDiv = document.createElement('div');
                    codeDiv.style.fontWeight = '600';
                    codeDiv.style.fontSize = '14px';
                    codeDiv.style.color = '#1a1a2e';
                    codeDiv.innerHTML = escapeHtml(machine.code || '');
                    infoDiv.appendChild(codeDiv);
                    
                    var nameDiv = document.createElement('div');
                    nameDiv.style.fontSize = '11px';
                    nameDiv.style.color = '#6c757d';
                    nameDiv.style.marginTop = '3px';
                    nameDiv.innerHTML = escapeHtml(machine.name || '');
                    infoDiv.appendChild(nameDiv);
                    
                    mainRow.appendChild(infoDiv);
                    
                    if (machine.type) {
                        var typeBadge = document.createElement('div');
                        typeBadge.style.backgroundColor = '#e0f2fe';
                        typeBadge.style.color = '#0369a1';
                        typeBadge.style.padding = '2px 8px';
                        typeBadge.style.borderRadius = '12px';
                        typeBadge.style.fontSize = '10px';
                        typeBadge.style.fontWeight = '600';
                        typeBadge.innerHTML = escapeHtml(machine.type);
                        mainRow.appendChild(typeBadge);
                    }
                    
                    div.appendChild(mainRow);
                    
                    div.addEventListener('mouseenter', function(el) {
                        return function() { el.style.backgroundColor = '#e8f0fe'; el.style.borderLeft = '3px solid #0d6efd'; };
                    }(div));
                    
                    div.addEventListener('mouseleave', function(el, idx) {
                        return function() { el.style.backgroundColor = (idx % 2 === 0) ? '#ffffff' : '#fafbfc'; el.style.borderLeft = 'none'; };
                    }(div, i));
                    
                    div.addEventListener('click', function(m) {
                        return function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            selectMachine(m);
                        };
                    }(machine));
                    
                    fragment.appendChild(div);
                }
                
                machineSuggestionsDiv.appendChild(fragment);
                machineSuggestionsDiv.style.display = 'block';
            }
            
            function selectMachine(machine) {
                if (!machine) return;
                machineInput.value = machine.code;
                if (hfMachineId) hfMachineId.value = machine.id;
                if (hfMachineCode) hfMachineCode.value = machine.code;
                if (hfMachineName) hfMachineName.value = machine.name;
                
                var litName = document.getElementById('<%= litMachineName.ClientID %>');
                var litCode = document.getElementById('<%= litMachineCode.ClientID %>');
                var litType = document.getElementById('<%= litMachineType.ClientID %>');
                var litDept = document.getElementById('<%= litDepartment.ClientID %>');
                var pnlMachine = document.getElementById('<%= pnlMachineInfo.ClientID %>');
                
                if (litName) litName.innerText = machine.name || 'N/A';
                if (litCode) litCode.innerText = machine.code || 'N/A';
                if (litType) litType.innerText = machine.type || 'N/A';
                if (litDept) litDept.innerText = machine.department || 'N/A';
                if (pnlMachine) pnlMachine.style.display = 'block';
                
                machineSuggestionsDiv.style.display = 'none';
            }
            
            function updateProcessFilter() {
                if (!processFilter) return;
                currentProcessFilter = processFilter.value;
                spareSearchCache.clear();
                sparePartInput.value = '';
                if (hfPartId) hfPartId.value = '';
                if (hfPartCode) hfPartCode.value = '';
                if (hfPartName) hfPartName.value = '';
                
                if (sparePartInput.value.length >= MIN_SEARCH_LENGTH) {
                    var results = searchSpareParts(sparePartInput.value);
                    displaySpareSuggestions(results);
                } else if (sparePartInput.value.length === 0) {
                    var results = getFilteredSpareParts().slice(0, 20);
                    displaySpareSuggestions(results);
                }
            }
            
            // Helper Functions
            function escapeHtml(text) {
                if (!text) return '';
                var div = document.createElement('div');
                div.textContent = text;
                return div.innerHTML;
            }
            
            function highlightRequiredFields() {
                var hfPartId = document.getElementById('<%= hfPartId.ClientID %>');
                if (!hfPartId || hfPartId.value === '') {
                    if (sparePartInput) sparePartInput.classList.add('error-highlight');
                }
                var personReceive = document.getElementById('<%= txtPersonReceive.ClientID %>');
                if (personReceive && personReceive.value.trim() === '') {
                    personReceive.classList.add('error-highlight');
                }
                var remark = document.getElementById('<%= txtRemark.ClientID %>');
                if (remark && remark.value.trim() === '') {
                    remark.classList.add('error-highlight');
                }
            }
            
            function setupFieldListeners() {
                var personReceive = document.getElementById('<%= txtPersonReceive.ClientID %>');
                if (personReceive) {
                    personReceive.addEventListener('input', function() { this.classList.remove('error-highlight'); });
                }
                var remark = document.getElementById('<%= txtRemark.ClientID %>');
                if (remark) {
                    remark.addEventListener('input', function () { this.classList.remove('error-highlight'); });
                }
                if (sparePartInput) {
                    sparePartInput.addEventListener('input', function () { this.classList.remove('error-highlight'); });
                }
            }

            // Debounced search handlers
            var spareSearchTimeout, machineSearchTimeout;

            function handleSpareSearch() {
                clearTimeout(spareSearchTimeout);

                spareSearchTimeout = setTimeout(function () {
                    var results = searchSpareParts(sparePartInput.value);
                    displaySpareSuggestions(results);
                }, SEARCH_DEBOUNCE_MS);
            }

            function handleMachineSearch() {
                clearTimeout(machineSearchTimeout);
                machineSearchTimeout = setTimeout(function () {
                    var results = searchMachines(machineInput.value);
                    displayMachineSuggestions(results);
                }, SEARCH_DEBOUNCE_MS);
            }

            function setupEventListeners() {
                if (qrScanInput && qrScanButton) {
                    qrScanInput.addEventListener('keydown', function (e) {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            qrScanButton.click();
                        }
                    });
                }

                // Process filter
                if (processFilter) {
                    processFilter.addEventListener('change', updateProcessFilter);
                }

                // Spare part events
                sparePartInput.addEventListener('input', handleSpareSearch);
                sparePartInput.addEventListener('keydown', function (e) {
                    if (e.key === 'Enter' && qrScanInput && qrScanButton &&
                        sparePartInput.value.indexOf('(D@10)') !== -1) {
                        e.preventDefault();
                        qrScanInput.value = sparePartInput.value;
                        qrScanButton.click();
                    }
                });
                sparePartInput.addEventListener('click', function (e) {
                    e.stopPropagation();
                    if (sparePartInput.value.length >= MIN_SEARCH_LENGTH) {
                        var results = searchSpareParts(sparePartInput.value);
                        displaySpareSuggestions(results);
                    } else if (masterSparePartsData) {
                        var results = getFilteredSpareParts().slice(0, 20);
                        displaySpareSuggestions(results);
                    }
                });

                // Machine events
                if (machineInput) {
                    machineInput.addEventListener('input', handleMachineSearch);
                    machineInput.addEventListener('click', function (e) {
                        e.stopPropagation();
                        if (machineInput.value.length >= MIN_SEARCH_LENGTH) {
                            var results = searchMachines(machineInput.value);
                            displayMachineSuggestions(results);
                        } else if (masterMachinesData) {
                            var results = masterMachinesData.slice(0, 20);
                            displayMachineSuggestions(results);
                        }
                    });
                }

                // Close suggestions when clicking outside
                document.addEventListener('click', function (e) {
                    if (e.target !== sparePartInput && spareSuggestionsDiv && !spareSuggestionsDiv.contains(e.target)) {
                        spareSuggestionsDiv.style.display = 'none';
                    }
                    if (machineInput && machineSuggestionsDiv && e.target !== machineInput && !machineSuggestionsDiv.contains(e.target)) {
                        machineSuggestionsDiv.style.display = 'none';
                    }
                });

                // Keyboard navigation for spare parts
                sparePartInput.addEventListener('keydown', function (e) {
                    var items = spareSuggestionsDiv.children;
                    if (e.key === 'Enter' && spareSuggestionsDiv.style.display === 'block' && items.length > 0) {
                        e.preventDefault();
                        if (items[0] && items[0].innerText !== 'Type at least 2 characters to search...') {
                            items[0].click();
                        }
                    } else if (e.key === 'Escape') {
                        spareSuggestionsDiv.style.display = 'none';
                    }
                });

                // Keyboard navigation for machines
                if (machineInput) {
                    machineInput.addEventListener('keydown', function (e) {
                        var items = machineSuggestionsDiv.children;
                        if (e.key === 'Enter' && machineSuggestionsDiv.style.display === 'block' && items.length > 0) {
                            e.preventDefault();
                            if (items[0] && items[0].innerText !== 'No machines found') {
                                items[0].click();
                            }
                        } else if (e.key === 'Escape') {
                            machineSuggestionsDiv.style.display = 'none';
                        }
                    });
                }
            }

            function setupPostbackHandler() {
                if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                    if (prm) {
                        prm.add_beginRequest(function () {
                            if (sparePartInput) sparePartInput.style.opacity = '0.6';
                        });
                        prm.add_endRequest(function () {
                            if (sparePartInput) sparePartInput.style.opacity = '1';
                            if (window.sparePartsMasterData && masterSparePartsData !== window.sparePartsMasterData) {
                                masterSparePartsData = window.sparePartsMasterData;
                                spareSearchCache.clear();
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