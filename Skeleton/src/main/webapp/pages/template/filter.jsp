<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="panel panel-default">
	<div class="panel-heading">Filter Ads</div>
	<div class="panel-body">



		<c:if test="${param.showFilter eq false}">
			<a href="ads/showFilter">
				<button class="btn btn-success btn-lg btn-block" type="button">Zeige
					den Filter</button>
			</a>
		</c:if>
		<c:if test="${param.showFilter eq true}">
			<a href="ads/closeFilter">
				<button class="btn btn-warning btn-lg btn-block" type="button">Verstecke
					den Filter</button>
			</a>
		</c:if>

		<c:if test="${param.showFilter eq true}">

			
	<form:form method="post" modelAttribute="filterForm" action="filterAds" id="newAdForm" cssClass="form-horizontal" autocomplete="off" enctype="multipart/form-data">
		

				<div class="col-md-6">
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="furnished" id="field-furnished" />Möbliert</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="hasLaundry" id="field-Laundry" />Waschmachine</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="hasDishwasher" id="field-Dishwasher" />Geschirrspüler</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="hasBalcony" id="field-Balcony" />Balkon</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="smokingInside" id="field-smokingInside" /> Rauchen im Haus</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="hasPets" id="field-pets" />Haustiere erlaubt</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="wlan" id="field-wlan" />Wlan</label>
					</h3>

				</div>
				<div class="col-md-6">

					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="hasBuiltInCloset" id="field-closet" />Einbauschrank im
							Zimmer</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="toBalcony" id="field-isToBalcony" />Balkonzugang vom
							Zimmer</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><form:checkbox
								path="hasCables" id="field-Cables" />Kabelanschluss im Zimmer</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"> <font
							color="000000"> <form:select path="wgType"
									id="field-wgType">
									<option value="undef">egal</option>
									<option value="wild">eher wild</option>
									<option value="calm">eher ruhig</option>


								</form:select>
						</font> Grober Wg Typ
						</label>
					</h3>

					<h3>
						<label class="btn btn-default btn-lg btn-block"><font
							color="000000"><form:input path="roomPrice"
									id="field-roomPrice" maxlength="6" /></font> Maximaler Zimmerpreis</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><font
							color="000000"><form:input path="city" id="field-city"
									maxlength="15" /></font>Stadt</label>
					</h3>
					<h3>
						<label class="btn btn-default btn-lg btn-block"><font
							color="000000"><form:select path="wgGender"
									id="field-wgGender" tabindex="13">
									<option value="dontcare">Egal</option>
									<option value="female">Reine Frauenwg</option>
									<option value="male">Reine Männerwg</option>


								</form:select></font>Geschlechteraufteilung in der WG</label>
					</h3>

					<button type="submit" class="btn btn-success btn-lg btn-block">Filter</button>
				</div>

	
			</form:form>
		</c:if>
	</div>
</div>




