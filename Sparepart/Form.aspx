<%@ Page Title="Spare Part Form" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="Form.aspx.cs"
    Inherits="QlyMain.Sparepart.Form" EnableEventValidation="false" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom: 16px;">
            <asp:Literal ID="litMsg" runat="server" />
        </div>
    </asp:Panel>
    
    <style>
        .multi-select-dropdown {
            position: relative;
            width: 100%;
        }
        
        .dropdown-select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            background-color: white;
            cursor: pointer;
            font-size: 14px;
            min-height: 38px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .dropdown-select:hover {
            border-color: #94a3b8;
        }
        
        .dropdown-arrow {
            font-size: 12px;
            color: #64748b;
        }
        
        .dropdown-items {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            margin-top: 4px;
            max-height: 280px;
            overflow-y: auto;
            z-index: 1000;
            display: none;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
        
        .dropdown-items.show {
            display: block;
        }
        
        .dropdown-item {
            padding: 8px 12px;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .dropdown-item:hover {
            background-color: #f1f5f9;
        }
        
        .dropdown-item input[type="checkbox"] {
            margin: 0;
            cursor: pointer;
        }
        
        .dropdown-item label {
            margin: 0;
            cursor: pointer;
            flex: 1;
            font-weight: normal;
        }
        
        .selected-items {
            flex: 1;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #1e293b;
        }
        
        .placeholder-text {
            color: #94a3b8;
        }
        
        .search-box {
            padding: 8px;
            border-bottom: 1px solid #e2e8f0;
            position: sticky;
            top: 0;
            background: white;
        }
        
        .search-box input {
            width: 100%;
            padding: 6px 8px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            font-size: 13px;
        }
        
        .search-box input:focus {
            outline: none;
            border-color: #3b82f6;
        }
    </style>
    
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
        <div class="card">
            <div class="card-header">
                <span class="card-title">
                    <i class="fa-solid fa-clipboard-list"></i> Basic Information
                </span>
            </div>
            <div class="card-body">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px;">
                    <div class="form-group">
                        <label class="form-label">Item Code *</label>
                        <asp:TextBox ID="txtItemCode" runat="server" CssClass="form-control" placeholder="SP-001" />
                        <asp:RequiredFieldValidator ControlToValidate="txtItemCode" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" Font-Size="11px" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Part No</label>
                        <asp:TextBox ID="txtPartNo" runat="server" CssClass="form-control" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Part Name *</label>
                    <asp:TextBox ID="txtPartName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="txtPartName" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" Font-Size="11px" />
                </div>
                
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px;">
                    <div class="form-group">
                        <label class="form-label">Maker</label>
                        <asp:TextBox ID="txtMaker" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Model</label>
                        <asp:TextBox ID="txtModel" runat="server" CssClass="form-control" />
                    </div>
                    
                    <!-- Multi-Select Machine Name Dropdown -->
                    <div class="form-group" style="grid-column: span 2;">
                        <label class="form-label">Machine Name</label>
                        <div class="multi-select-dropdown">
                            <div class="dropdown-select" id="dropdownSelect">
                                <span class="selected-items" id="selectedItemsDisplay">Select machine names...</span>
                                <span class="dropdown-arrow">▼</span>
                            </div>
                            <div class="dropdown-items" id="dropdownItems">
                                <div class="search-box">
                                    <input type="text" id="searchMachine" placeholder="Search machines by name or code..." />
                                </div>
                                <div id="machineListContainer"></div>
                            </div>
                        </div>
                        <asp:HiddenField ID="hfSelectedMachineNames" runat="server" />
                        <asp:HiddenField ID="hfSelectedMachineCodes" runat="server" />
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Process</label>
                        <asp:DropDownList ID="ddlProcess" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Unit</label>
                        <asp:TextBox ID="txtUnit" runat="server" CssClass="form-control" placeholder="Pcs, Set..." />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Cabinet / Location</label>
                        <asp:TextBox ID="txtPositionSave" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Supplier</label>
                        <asp:TextBox ID="txtSupplier" runat="server" CssClass="form-control" />
                    </div>
                </div>
                
                <!-- Machine Number Display -->
                <div class="form-group">
                    <label class="form-label">MACHINE NUMBER (ListCodeMachine)</label>
                    <asp:TextBox ID="txtListCodeMachine" runat="server" CssClass="form-control" 
                        placeholder="Machine numbers will auto-populate based on selected machine names" 
                        TextMode="MultiLine" Rows="2" ReadOnly="true" BackColor="#F8FAFC" />
                    <small style="color: #666;">Machine numbers are automatically populated when machine names are selected</small>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Remark</label>
                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>
            </div>
        </div>
        
        <div>
            <div class="card" style="margin-bottom: 16px;">
                <div class="card-header">
                    <span class="card-title">
                        <i class="fa-solid fa-chart-bar"></i> Stock & Order Settings
                    </span>
                </div>
                <div class="card-body">
                    <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 12px;">
                        <div class="form-group">
                            <label class="form-label">Safety Stock</label>
                            <asp:TextBox ID="txtSafetyStock" runat="server" CssClass="form-control" TextMode="Number" Text="0" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Safety Show</label>
                            <asp:TextBox ID="txtSafetyStockShow" runat="server" CssClass="form-control" Text="0" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Order Qty</label>
                            <asp:TextBox ID="txtOrderQty" runat="server" CssClass="form-control" TextMode="Number" Text="0" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Lead Time (days)</label>
                            <asp:TextBox ID="txtLeadTime" runat="server" CssClass="form-control" TextMode="Number" Text="0" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">MOQ / SPQ</label>
                            <asp:TextBox ID="txtMOQ" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Cost</label>
                            <asp:TextBox ID="txtCost" runat="server" CssClass="form-control" TextMode="Number" Text="0" step="0.01" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Currency</label>
                            <asp:TextBox ID="txtCurrency" runat="server" CssClass="form-control" placeholder="USD, JPY..." />
                        </div>
                    </div>
                    <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; margin-top: 8px;">
                        <div style="font-size: 11px; color: #64748b;">Current QtyStock</div>
                        <div style="font-size: 26px; font-weight: 700; font-family: 'IBM Plex Sans',sans-serif;">
                            <asp:Literal ID="litQtyStock" runat="server" Text="0" />
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Image Upload Section -->
            <div class="card" style="margin-bottom: 16px;">
                <div class="card-header">
                    <span class="card-title">
                        <i class="fa-solid fa-image"></i> Part Image
                    </span>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label class="form-label">Upload Image</label>
                        <asp:FileUpload ID="fuPartImage" runat="server" CssClass="form-control" accept="image/jpeg,image/jpg,image/png,image/gif,image/bmp,image/webp" />
                        <small style="color: #666;">Accepted formats: JPG, JPEG, PNG, GIF, BMP, WEBP. Will be converted to JPEG format. Max size: 5MB</small>
                    </div>
                    
                    <!-- Current Image Display -->
                    <asp:Panel ID="pnlCurrentImage" runat="server" Visible="false" style="margin-top: 15px;">
                        <div style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #f8fafc;">
                            <div style="font-size: 12px; font-weight: 600; margin-bottom: 8px; color: #475569;">Current Image:</div>
                            <asp:Image ID="imgPartImage" runat="server" Style="max-width: 100%; max-height: 200px; border-radius: 4px;" 
                                AlternateText="Part Image" />
                            <div style="margin-top: 8px;">
                                <asp:CheckBox ID="chkRemoveImage" runat="server" Text="Remove current image" AutoPostBack="false" />
                            </div>
                        </div>
                    </asp:Panel>
                    
                    <asp:HiddenField ID="hfCurrentImage" runat="server" />
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <span class="card-title">
                        <i class="bi bi-tags-fill"></i> Flags
                    </span>
                </div>
                <div class="card-body" style="display: flex; gap: 24px; flex-wrap: wrap;">
                    <div>
                        <asp:CheckBox ID="chkIsUsing" runat="server" Checked="true" />
                        <label>Is Using (Active)</label>
                    </div>
                    <div>
                        <asp:CheckBox ID="chkIsOrder" runat="server" />
                        <label>Is Order</label>
                    </div>
                    <div>
                        <asp:CheckBox ID="chkFavourite" runat="server" />
                        <label>&#9733; Favourite</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div style="display: flex; gap: 10px; margin-top: 16px;">
        <asp:Button ID="btnSave" runat="server" Text=" Save" CssClass="btn btn-primary" OnClick="BtnSave_Click" />
        <asp:HyperLink NavigateUrl="~/Sparepart/List.aspx" CssClass="btn btn-secondary" runat="server">
            <i class="bi bi-arrow-return-left"></i> Back
        </asp:HyperLink>
    </div>
    
    <asp:HiddenField ID="hfPartID" runat="server" Value="0" />
    <asp:HiddenField ID="hfMachinesData" runat="server" />
    <asp:HiddenField ID="txtTypeSP" runat="server" />

    <script type="text/javascript">
        let machinesList = [];
        let selectedMachines = [];

        // Initialize multi-select dropdown
        document.addEventListener('DOMContentLoaded', function () {
            // Load machines data
            const machinesData = document.getElementById('<%= hfMachinesData.ClientID %>');
            if (machinesData && machinesData.value) {
                try {
                    machinesList = JSON.parse(machinesData.value);
                    console.log('Loaded machines:', machinesList.length);
                } catch (e) {
                    console.error('Error parsing machines data:', e);
                }
            }

            initializeMultiSelect();

            // Load selected machines from server-side data
            loadSelectedMachinesFromServer();

            // File upload validation
            const fileUpload = document.getElementById('<%= fuPartImage.ClientID %>');
            if (fileUpload) {
                fileUpload.addEventListener('change', function () {
                    validateFileSize(this);
                });
            }
        });

        function loadSelectedMachinesFromServer() {
            const hfSelectedCodes = document.getElementById('<%= hfSelectedMachineCodes.ClientID %>');
            if (hfSelectedCodes && hfSelectedCodes.value) {
                const codes = hfSelectedCodes.value.split(', ');
                console.log('Loading selected machines from server:', codes);

                selectedMachines = [];
                codes.forEach(code => {
                    if (code && code.trim()) {
                        const machine = machinesList.find(m => m.code === code.trim());
                        if (machine) {
                            selectedMachines.push(machine);
                            console.log('Added machine:', machine.name);
                        }
                    }
                });

                updateDisplays();
            }
        }

        function initializeMultiSelect() {
            const dropdownSelect = document.getElementById('dropdownSelect');
            const dropdownItems = document.getElementById('dropdownItems');
            const machineListContainer = document.getElementById('machineListContainer');
            const searchInput = document.getElementById('searchMachine');

            if (!dropdownSelect || !dropdownItems || !machineListContainer) return;

            // Populate machine list
            function renderMachineList(filter = '') {
                const filteredMachines = machinesList.filter(m =>
                    m.name.toLowerCase().includes(filter.toLowerCase()) ||
                    m.code.toLowerCase().includes(filter.toLowerCase())
                );

                machineListContainer.innerHTML = '';
                if (filteredMachines.length === 0) {
                    machineListContainer.innerHTML = '<div style="padding: 12px; text-align: center; color: #64748b;">No machines found</div>';
                    return;
                }

                filteredMachines.forEach(machine => {
                    const isChecked = selectedMachines.some(sm => sm.code === machine.code);
                    const div = document.createElement('div');
                    div.className = 'dropdown-item';
                    div.innerHTML = `
                        <input type="checkbox" value="${escapeHtml(machine.code)}" data-name="${escapeHtml(machine.name)}" data-code="${escapeHtml(machine.code)}" ${isChecked ? 'checked' : ''}>
                        <label>${escapeHtml(machine.name)} - ${escapeHtml(machine.code)}</label>
                    `;
                    const checkbox = div.querySelector('input');
                    checkbox.addEventListener('change', function (e) {
                        e.stopPropagation();
                        if (this.checked) {
                            addMachine({ code: this.value, name: this.dataset.name });
                        } else {
                            removeMachine(this.value);
                        }
                    });
                    machineListContainer.appendChild(div);
                });
            }

            // Update displays
            function updateDisplays() {
                const displaySpan = document.getElementById('selectedItemsDisplay');
                const machineCodeField = document.getElementById('<%= txtListCodeMachine.ClientID %>');
                const hfMachineNames = document.getElementById('<%= hfSelectedMachineNames.ClientID %>');
                const hfMachineCodes = document.getElementById('<%= hfSelectedMachineCodes.ClientID %>');
                const txtTypeSP = document.getElementById('<%= txtTypeSP.ClientID %>');

                if (selectedMachines.length === 0) {
                    displaySpan.innerHTML = '<span class="placeholder-text">Select machine names...</span>';
                    displaySpan.className = 'selected-items placeholder-text';
                    if (machineCodeField) machineCodeField.value = '';
                    if (hfMachineNames) hfMachineNames.value = '';
                    if (hfMachineCodes) hfMachineCodes.value = '';
                    if (txtTypeSP) txtTypeSP.value = '';
                } else {
                    const names = selectedMachines.map(m => m.name).join(', ');
                    const codes = selectedMachines.map(m => m.code).join(', ');
                    displaySpan.innerHTML = names;
                    displaySpan.className = 'selected-items';
                    if (machineCodeField) machineCodeField.value = codes;
                    if (hfMachineNames) hfMachineNames.value = names;
                    if (hfMachineCodes) hfMachineCodes.value = codes;
                    if (txtTypeSP) txtTypeSP.value = names;
                }

                // Update checkboxes in dropdown if open
                if (machineListContainer && dropdownItems.classList.contains('show')) {
                    const checkboxes = machineListContainer.querySelectorAll('input[type="checkbox"]');
                    checkboxes.forEach(cb => {
                        cb.checked = selectedMachines.some(m => m.code === cb.value);
                    });
                }
            }

            // Expose updateDisplays globally
            window.updateDisplays = updateDisplays;

            // Toggle dropdown
            dropdownSelect.addEventListener('click', function (e) {
                e.stopPropagation();
                dropdownItems.classList.toggle('show');
                if (dropdownItems.classList.contains('show')) {
                    renderMachineList(searchInput ? searchInput.value : '');
                    if (searchInput) searchInput.focus();
                }
            });

            // Search functionality
            if (searchInput) {
                searchInput.addEventListener('input', function (e) {
                    renderMachineList(e.target.value);
                });

                searchInput.addEventListener('click', function (e) {
                    e.stopPropagation();
                });
            }

            // Close dropdown when clicking outside
            document.addEventListener('click', function (e) {
                if (!dropdownSelect.contains(e.target) && !dropdownItems.contains(e.target)) {
                    dropdownItems.classList.remove('show');
                }
            });

            // Prevent dropdown from closing when clicking inside
            dropdownItems.addEventListener('click', function (e) {
                e.stopPropagation();
            });
        }

        function addMachine(machine) {
            if (!selectedMachines.some(m => m.code === machine.code)) {
                selectedMachines.push(machine);
                if (window.updateDisplays) window.updateDisplays();
                else updateDisplays();
            }
        }

        function removeMachine(code) {
            selectedMachines = selectedMachines.filter(m => m.code !== code);
            if (window.updateDisplays) window.updateDisplays();
            else updateDisplays();
        }

        function escapeHtml(text) {
            if (!text) return '';
            const div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }

        function validateFileSize(input) {
            if (input.files && input.files[0]) {
                const maxSize = 5 * 1024 * 1024;
                if (input.files[0].size > maxSize) {
                    alert('File size must be less than 5MB');
                    input.value = '';
                    return false;
                }
                return true;
            }
            return true;
        }
    </script>
</asp:Content>