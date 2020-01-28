package com.group4.erp;

import java.util.List;

public class MainChartsDTO {
	private List<CommonChartDTO> sellingStat;
	private List<CommonChartDTO> ageStat;
	private List<CommonChartDTO> genderStat;
	private List<CommonChartDTO> eventStat;

	public List<CommonChartDTO> getSellingStat() {
		return sellingStat;
	}

	public void setSellingStat(List<CommonChartDTO> sellingStat) {
		this.sellingStat = sellingStat;
	}

	public List<CommonChartDTO> getAgeStat() {
		return ageStat;
	}

	public void setAgeStat(List<CommonChartDTO> ageStat) {
		this.ageStat = ageStat;
	}

	public List<CommonChartDTO> getGenderStat() {
		return genderStat;
	}

	public void setGenderStat(List<CommonChartDTO> genderStat) {
		this.genderStat = genderStat;
	}

	public List<CommonChartDTO> getEventStat() {
		return eventStat;
	}

	public void setEventStat(List<CommonChartDTO> eventStat) {
		this.eventStat = eventStat;
	}

	@Override
	public String toString() {
		return "MainChartsDTO [sellingStat=" + sellingStat + ", ageStat=" + ageStat + ", genderStat=" + genderStat
				+ ", eventStat=" + eventStat + "]";
	}

}
