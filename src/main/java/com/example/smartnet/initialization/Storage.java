package com.example.smartnet.initialization;

import java.util.Date;

public class Storage {

    private Long productId;
    private String productType;
    private String vendorName;
    private String serialNumber;
    private String partNumber;
    private String description;
    private String storageName;
    private Date incomeDate;
    private String status;

    public Storage() {
    }

    public Storage(Long productId, String productType, String vendorName, String serialNumber, String partNumber, String description, String storageName, Date incomeDate, String status) {
        this.productId = productId;
        this.productType = productType;
        this.vendorName = vendorName;
        this.serialNumber = serialNumber;
        this.partNumber = partNumber;
        this.description = description;
        this.storageName = storageName;
        this.incomeDate = incomeDate;
        this.status = status;
    }

    public Long getProductId() {
        return productId;
    }


    public String getProductType() {
        return productType;
    }


    public String getVendorName() {
        return vendorName;
    }


    public String getSerialNumber() {
        return serialNumber;
    }


    public String getPartNumber() {
        return partNumber;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStorageName() {
        return storageName;
    }


    public Date getIncomeDate() {
        return incomeDate;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Storage{" +
                "productId=" + productId +
                ", productType='" + productType + '\'' +
                ", vendorName='" + vendorName + '\'' +
                ", serialNumber='" + serialNumber + '\'' +
                ", partNumber='" + partNumber + '\'' +
                ", description='" + description + '\'' +
                ", storageName='" + storageName + '\'' +
                ", incomeDate=" + incomeDate +
                ", status='" + status + '\'' +
                '}';
    }
}

