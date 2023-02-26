package com.example.smartnet.initialization;

import java.util.Date;

public class StorageHistory {
    private Long historyId;
    private String vendorName;
    private String productType;
    private String serialNUmber;
    private String partNumber;
    private String storageName;
    private Date incomeDate;
    private Date operationDate;
    private String operatorName;
    private String operationName;

    public StorageHistory() {
    }

    public StorageHistory(Long historyId, String vendorName, String productType, String serialNUmber, String partNumber, String storageName, Date incomeDate, Date operationDate, String operatorName, String operationName) {
        this.historyId = historyId;
        this.vendorName = vendorName;
        this.productType = productType;
        this.serialNUmber = serialNUmber;
        this.partNumber = partNumber;
        this.storageName = storageName;
        this.incomeDate = incomeDate;
        this.operationDate = operationDate;
        this.operatorName = operatorName;
        this.operationName = operationName;
    }

    public Long getHistoryId() {
        return historyId;
    }

    public void setHistoryId(Long historyId) {
        this.historyId = historyId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getSerialNUmber() {
        return serialNUmber;
    }

    public void setSerialNUmber(String serialNUmber) {
        this.serialNUmber = serialNUmber;
    }

    public String getPartNumber() {
        return partNumber;
    }

    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }

    public String getStorageName() {
        return storageName;
    }

    public void setStorageName(String storageName) {
        this.storageName = storageName;
    }

    public Date getIncomeDate() {
        return incomeDate;
    }

    public void setIncomeDate(Date incomeDate) {
        this.incomeDate = incomeDate;
    }

    public Date getOperationDate() {
        return operationDate;
    }

    public void setOperationDate(Date operationDate) {
        this.operationDate = operationDate;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
    }

    @Override
    public String toString() {
        return "StorageHistory{" +
                "historyId=" + historyId +
                ", vendorName='" + vendorName + '\'' +
                ", productType='" + productType + '\'' +
                ", serialNUmber='" + serialNUmber + '\'' +
                ", partNumber='" + partNumber + '\'' +
                ", storageName='" + storageName + '\'' +
                ", incomeDate=" + incomeDate +
                ", operationDate=" + operationDate +
                ", operatorName='" + operatorName + '\'' +
                ", operationName='" + operationName + '\'' +
                '}';
    }
}
