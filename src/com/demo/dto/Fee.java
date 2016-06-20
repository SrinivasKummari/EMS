
package com.demo.dto;

public class Fee {

	private Integer feeId;
	private Float regFee;
	private Float feePaid;
	private Float tutionFee;
	private Float misFee;
	private Float totalFee;
	public Integer getFeeId() {
		return feeId;
	}
	public void setFeeId(Integer feeId) {
		this.feeId = feeId;
	}
	public Float getRegFee() {
		return regFee;
	}
	public void setRegFee(Float regFee) {
		this.regFee = regFee;
	}
	public Float getFeePaid() {
		return feePaid;
	}
	public void setFeePaid(Float feePaid) {
		this.feePaid = feePaid;
	}
	public Float getTutionFee() {
		return tutionFee;
	}
	public void setTutionFee(Float tutionFee) {
		this.tutionFee = tutionFee;
	}
	public Float getMisFee() {
		return misFee;
	}
	public void setMisFee(Float misFee) {
		this.misFee = misFee;
	}
	public Float getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(Float totalFee) {
		this.totalFee = totalFee;
	}
}
