<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="RingiControl.aspx.cs" Async="true" Inherits="QlyMain.Accounting.RingiControl" MaintainScrollPositionOnPostback="true" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #80808024;
        }

        .box {
            background: white;
            box-shadow: 0 4px 8px 0 rgb(67 65 65 / 20%), 0 6px 20px 0 rgb(255 255 255 / 0%);
            padding: 2px 0 2px 0;
            width: 100%;
            zoom: 96%;
            padding: 0 15px 0 15px;
            margin-bottom: 2px;
            border-bottom: 2px solid #8cb6ca;
        }

        table tbody th, td {
            padding: 5px;
        }

        .box-shadow2 {
            box-shadow: 1px 1px 1px 1px #424c519c;
            border-radius: 1px;
        }

        .box-shadow1 {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 0.5%;
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
            /*  border: 1px solid black;*/
        }

        .gvstyling th {
            background-color: #607d8b;
            color: white;
            border: 1px solid #9e9e9e;
            text-align: center;
        }

        .margin0 {
            margin: 0 !important;
        }

        .pointer {
            cursor: pointer;
        }
    </style>
    <style>
        .popup {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .popup-content {
            background-color: #fefefe;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #888;
            max-width: 1300px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            color: red;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

        #partsTableContainer {
            max-height: 500px;
            overflow-y: auto;
        }

        #UploadTableContainer {
            max-height: 500px;
            overflow-y: auto;
        }

        #partsTable {
            width: 100%;
            border-collapse: collapse;
        }

        #UploadTable {
            width: 100%;
            border-collapse: collapse;
        }

        #partsTable th,
        #partsTable td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        #partsTable th {
            background-color: #f2f2f2;
        }

        #UploadTable th,
        #UploadTable td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        #UploadTable th {
            background-color: #f2f2f2;
        }
    </style>
    <style>
        .loading-indicator {
            display: none;
            /* Căn giữa trên trang hoặc theo ý muốn */
            /*   position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);*/
        }
    </style>

    <div class="container">
        <div class="row" style="margin-top: 5%">
            <h3>Ring List</h3>
            <asp:LinkButton Text="" runat="server" ID="lbkOpenAdd" CssClass="btn btn-default marginRight10"
                OnClick="lbExport"> Export <i class="fa fa-plus" style="color:steelblue"></i></asp:LinkButton>

            <asp:LinkButton Text="" runat="server" ID="LinkButton1" CssClass="btn btn-default marginRight10"
                OnClick="lbUpload"> SAP Data <i class="fa fa-delicious" style="color:chocolate"></i></asp:LinkButton>

        </div>

        <div class="row">
            <div>
                <br />

                <div>
                    <div id="loadingIndicator" class="loading-indicator">
                        <img src="loading.gif" alt="Loading..." />
                    </div>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover gvstyling box-shadow1 margin0 center" ShowHeaderWhenEmpty="True" BorderStyle="None" BorderWidth="1px" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="STT" />
                            <asp:BoundField Visible="false" DataField="ringId" HeaderText="Ring ID" />
                            <asp:BoundField DataField="RingiNo" HeaderText="Ringi No">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MCName" HeaderText="M/C Name" />
                            <asp:BoundField DataField="ISSUE_DATE" HeaderText="ISSUE_DATE" />
                            <asp:BoundField DataField="Requester" HeaderText="Requester">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Parts">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnShowParts" runat="server" Text="View" CssClass="btn btn-link" OnClick="btnShowParts_Click" CommandArgument='<%# Eval("RingiNo") %>'>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# GetStatusText((bool)Eval("Status")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IQ" HeaderText="IQ" />
                            <asp:BoundField DataField="Remark" HeaderText="Remark"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
        <div id="partsPopup" class="popup">
            <div class="popup-content">
                <span class="close" onclick="hidePopup()">&times;</span>
                <h3 id="idPartList"></h3>
                <div id="partsTableContainer">
                    <table id="partsTable" class=" table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Section</th>
                                <th>Location</th>
                                <th>Part Name</th>
                                <th>Quantity</th>
                                <th>Unit</th>
                                <th>UnitPrice</th>
                                <th>Currency</th>
                                <th>Amount</th>
                                <th>Supplier</th>
                                <th>RequestETA</th>
                                <th>ETA</th>
                                <th>PRNo</th>
                                <th>PONo</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="partsContent"></tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="UploadPopup" class="popup">
            <div class="popup-content">
                <span class="close" onclick="hideUploadPopup()">&times;</span>
                <h3>CIP List</h3>

                <b>Chọn file upload 
                </b>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default marginRight10" />
                <asp:LinkButton Text="" runat="server" ID="LinkButton2" CssClass="btn btn-default marginRight10"
                    OnClick="lbUploadData"> Upload Data <i class="fa fa-delicious" style="color:chocolate"></i></asp:LinkButton>
                <div id="UploadTableContainer">
                    <table id="UploadTable" lass=" table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>DocumentHeaderText</th>
                                <th>GLAccount</th>
                                <th>Assignment</th>
                                <th>DocumentNumber</th>
                                <th>BusinessArea</th>
                                <th>DocumentType</th>
                                <th>DocumentDate</th>
                                <th>PostingDate</th>
                                <th>EntryDate</th>
                                <th>PostingKey</th>
                                <th>AmountinDocCurr</th>
                                <th>DocumentCurrency</th>
                                <th>AmountinLocalCurrency</th>
                                <th>LocalCurrency</th>
                                <th>TaxCode</th>
                                <th>ClearingDocument</th>
                                <th>ProfitCenter </th>
                                <th>Segment            </th>
                                <th>Text               </th>
                                <th>OffsettingAccount  </th>
                                <th>Vendor             </th>
                                <th>Material           </th>
                                <th>PurchasingDocument </th>
                                <th>Item               </th>
                                <th>Asset              </th>
                                <th>Quantity           </th>
                                <th>BaseUnitofMeasure  </th>
                            </tr>
                        </thead>
                        <tbody id="CipUploadContent"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <script>
        function loadPartsList(partsJson) {
            // Chuyển đổi danh sách part từ dạng JSON sang JavaScript object
            var parts = JSON.parse(partsJson);

            var PartIdList = document.getElementById("idPartList");
            PartIdList.innerHTML = "Part List: " + parts[0].RingNo;

            var tableBody = document.getElementById("partsContent");
            tableBody.innerHTML = ""; // Xóa nội dung cũ trong bảng

            for (var i = 0; i < parts.length; i++) {
                var part = parts[i];

                var part = parts[i];
                var row = document.createElement("tr");

                var partNameCell = document.createElement("td");
                partNameCell.textContent = i + 1;
                row.appendChild(partNameCell);

                var partNameCell = document.createElement("td");
                partNameCell.textContent = part.Section;
                row.appendChild(partNameCell);

                var partNameCell = document.createElement("td");
                partNameCell.textContent = part.Location;
                row.appendChild(partNameCell);

                var partNameCell = document.createElement("td");
                partNameCell.textContent = part.Partname;
                row.appendChild(partNameCell);

                var qtyCell = document.createElement("td");
                qtyCell.textContent = part.Qty;
                row.appendChild(qtyCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Unit;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.UnitPrice;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Currency;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Amount;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Supplier;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = moment(part.RequestETA).format("DD.MMM.YY");
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = moment(part.ETA).format("DD.MMM.YY");
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.PRNo;
                row.appendChild(unitCell);

                var pOSAPsCell = document.createElement("td");
                var pOSAPsTable = document.createElement("table");



                if (part.pOSAPs.length > 0) {
                    var pOSAPRow = document.createElement("tr");
                    var pOSAPCell1 = document.createElement("td");
                    pOSAPCell1.textContent = "PONO";
                    pOSAPCell1.style = "font-weight: bold;";
                    pOSAPRow.appendChild(pOSAPCell1);

                    var pOSAPCell1 = document.createElement("td");
                    pOSAPCell1.textContent = "Item";
                    pOSAPCell1.style = "font-weight: bold;";
                    pOSAPRow.appendChild(pOSAPCell1);

                    pOSAPsTable.appendChild(pOSAPRow);
                }

                for (var j = 0; j < part.pOSAPs.length; j++) {
                    var pOSAP = part.pOSAPs[j];
                    var pOSAPRow = document.createElement("tr");

                    var pOSAPCell1 = document.createElement("td");
                    pOSAPCell1.textContent = pOSAP.PONo;
                    pOSAPRow.appendChild(pOSAPCell1);

                    var pOSAPCell1 = document.createElement("td");
                    pOSAPCell1.textContent = pOSAP.Status;
                    pOSAPRow.appendChild(pOSAPCell1);

                    var pOSAPCell1 = document.createElement("td");
                    pOSAPCell1.textContent = pOSAP.PostingDate != null ? moment(pOSAP.PostingDate).format("DD.MMM.YY") : "";
                    pOSAPRow.appendChild(pOSAPCell1);


                    pOSAPsTable.appendChild(pOSAPRow);
                }

                pOSAPsCell.appendChild(pOSAPsTable);
                row.appendChild(pOSAPsCell);
                tableBody.appendChild(row);
            }

            // Hiển thị popup hoặc thực hiện các thao tác khác tùy vào yêu cầu của bạn
            showPopup();
        }



        function loadCipUploadList(partsJson) {
            // Chuyển đổi danh sách part từ dạng JSON sang JavaScript object
            var parts = JSON.parse(partsJson);

            var tableBody = document.getElementById("CipUploadContent");
            tableBody.innerHTML = ""; // Xóa nội dung cũ trong bảng

            for (var i = 0; i < parts.length; i++) {
                var part = parts[i];

                var part = parts[i];
                var row = document.createElement("tr");

                var partNameCell = document.createElement("td");
                partNameCell.textContent = i + 1;
                row.appendChild(partNameCell);

                var partNameCell = document.createElement("td");
                partNameCell.textContent = part.DocumentHeaderText;
                row.appendChild(partNameCell);

                var partNameCell = document.createElement("td");
                partNameCell.textContent = part.GLAccount;
                row.appendChild(partNameCell);

                var partNameCell = document.createElement("td");
                partNameCell.textContent = part.Assignment;
                row.appendChild(partNameCell);

                var qtyCell = document.createElement("td");
                qtyCell.textContent = part.DocumentNumber;
                row.appendChild(qtyCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.BusinessArea;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.DocumentType;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = moment(part.DocumentDate).format("DD.MMM.YY");
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = moment(part.PostingDate).format("DD.MMM.YY");
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = moment(part.EntryDate).format("DD.MMM.YY");
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.PostingKey;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.AmountinDocCurr;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.DocumentCurrency;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.AmountinLocalCurrency;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.LocalCurrency;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.TaxCode;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.ClearingDocument;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.ProfitCenter;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Segment;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Text;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.OffsettingAccount;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Vendor;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Material;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.PurchasingDocument;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Item;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Asset;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.Quantity;
                row.appendChild(unitCell);

                var unitCell = document.createElement("td");
                unitCell.textContent = part.BaseUnitofMeasure;
                row.appendChild(unitCell);

                tableBody.appendChild(row);
            }

            // Hiển thị popup hoặc thực hiện các thao tác khác tùy vào yêu cầu của bạn
            showUploadPopup();
        }
        function showPopup() {
            var popup = document.getElementById("partsPopup");
            popup.style.display = "block";

        } function showUploadPopup() {
            var popup = document.getElementById("UploadPopup");
            popup.style.display = "block";
        }

        function hidePopup() {
            var popup = document.getElementById("partsPopup");
            popup.style.display = "none";
        }
        function hideUploadPopup() {
            var popup = document.getElementById("UploadPopup");
            popup.style.display = "none";
        }
        document.addEventListener('keydown', function (event) {
            // Kiểm tra xem phím nhấn có phải là phím Esc (mã phím là 27) hay không
            if (event.keyCode === 27) {
                // Đóng popup
                hidePopup();
            }
        });
    </script>


</asp:Content>
