Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795667;
	b=APxhdpIGkw3ruCiXG0tbV2B6WPdumKBphnVhpr250XfgL3VX/u2CEzUGzetiAb1JFNQG
	 yR8S4c4OFBXYGL7RutV0naWigAj/WH9MRQKySlVhIpHfV+sfn4sS1Pr5ppsB/ggRlXIrY
	 oGsGq4OaKHKNjZqvH+pXa9GFGmSJMNiI05k7KB1hWcI5i0sZi7H9YqxLNJec6SlWa7VUw
	 V8CMvTTwwN3TvuQq8BhdGKKGbQOn80uB8eu25VJwOnyU6brglctopMXYI60NAkDjtAuzx
	 GYEj3nwZ/6rkfnHCoh5O6RuI7X7IXCfXhea9N/gLi80f4OxJBPKyX++TqB6KF2m8/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=;
	b=U4V1CWZ0G4FvYKEnkVq+NLdW96SjngXlKGz86JGyleneUMj4tYJNvLSw+xqwBuJSFafM
	 Kem+HCqtuharLCTJJ5xk9ynEOEDQRurmDV7wdVw180fpQi+hkdK2Lcn+rEenvyRbNqmhE
	 ca/x7h4AWxreaO0X5Jyn6t8NB6FpJ5yneUX9L47V92LVHANTnsYUlcsndUNRc/FoiTH/P
	 eVc2BwkmIAFpbfniMRuO67PShE9VBcjq/uoUt9+5kHUFv3y/7mJYAXOB8DPJjrmdUaO2P
	 DimA4xjxNNbPiQIFaP8LunHlyobIAdTaV/EYk9HsgGjURtJBp33y3Y+nljXe4ZqN9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEVHkyZs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfX5IrOc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A1606A6A0
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4A1606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEVHkyZs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfX5IrOc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpKG0706882
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=; b=WEVHkyZsVYisc0Wt
	AzjI5Rb6YW9WFiskgw9YUu5/pHzGTbAFT290vtsXbKzAtqGfQs0ckom3JptmvmD3
	BIIblJcS8o7/yLHFy8GwV8sTmXLxZBy6V0N87Wu67/tPykMOfPVG2VtYHjNwlvWO
	J0QS1+xy6ToSh8cfsQ3zVqmUJMXw2AFyxId/zhlcQ1E84T4SyopF1tIz/S/iOqdi
	uXDsYJsowFriMInnwa0cvabnsMf70Tk9mUzSfWz5QxtfPzW8ZxZeKbThxKTVq3ws
	AQNV28aPOrb7cWrvfH1hOx5237qmUymeNCI+oHLtA3hRpwRp3sQF+Gbw6eSRFxIH
	llMX3A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6t6ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:07:46 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so107010807b3.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795665; x=1796400465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=;
        b=dfX5IrOczBm6LslHlt+04g+6Xebx479Zp7J4l9DVQN1yNqIg/Y04lCkaapzLn07HEh
         0aXi120quRh6JMNOngNTyE3FxkseHgjWYToPAWTXNlMbG9R+8eyqhUfUfirZ8Ahh47cE
         ej461gxQGS4IDNcSc2UvMf7sMaDhzABhaOWNWVrmdcT+K2fFqGiVqi+illo9Fh1JymTR
         6OSyQtbZE+Of8sQsiqOfx5ZO9exRj2oSdAdnj/ncsG3ord2QLvGNZRVvKLaVbSrzXnzY
         jP7MrVDqdzK9y9hVyuc/jztqRuTqpePEDlZsNwaGCLwtJUx2UJqCxFJxsZQ7ePerFZcA
         ttEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795665; x=1796400465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=;
        b=aTA3r+6HY8YMSdwl6OD97lRh0cSe4BhquIcmFSnLAZcsO2xBduHej+/PFgPFnmAf86
         vFvCbkAOLDmmJlVf6W+xrac04xL00g9J+qFU4UinXG2MhICOsPqQbHX1l+CLeLF9dXU2
         U1ftw4zGUErLhp7/XPLktZ7WmZuYJCDuPBMLXNksMCWX8MDmgytru1SMrW4P4F6ImWdk
         dFC1UCLBr7SCDF21henauJ7GLcUookgnFTqcjs2EZtV0rVmFI8l1HRScrzq88r77y3l5
         T5FaCESCp1lROAw/HeYSBy6cd1gj6tEPdAhLf9e2thnRydMXilvD93AcNDW7SkohJ2PN
         UqZg==
X-Forwarded-Encrypted: i=1; AL+hErGWok4d9FgykvfpnqF8WK85pRGL4/tNwB/SPhNeXC3HxY2UaDis9cmnsUdAjPT8GWA7DTCJ/h4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xem8KTuZBFrurJdOzdbeegaVHVerSOYZceUaGBaRMMtqIp6W0
	+tTDL5x371/eGfJDwWSxqmCBDov//DOvTB5Ga2KCY4Gy2A5asXBt1fK1vFBpyjP2jz7ZA3rrvBL
	HyfU68zMffBGVWzaDVBout0yAotC51CxhcGKeBwYkZasGBNfLBiPEdHQUvKAcCV4TCq8=
X-Gm-Gg: AZFdTZc10AyhMEgNE9QbFcvPjFmCtXIA0/SOMBB3nCqPSVGPxI62dhhDC9p60scdtek
	9NEw/gp+YjDzQSPoBP8uT9vOVy34AG05C5/Fo63gKKR1bUiWnGqw+oogTuo07n8XXIB/RdpC8ij
	+6Co8lrvPcL0+OirZnR2R6itZBpBdvzfTmuTEfQ75kB5SgUToc44556ue8aEvTe/Fx/UlvzYQdN
	2Nw+1dWg0ZN3dlFe35jd40OjT9zCFi2Jw29GwNdMlsU/kE9+6j77YEsJ/DlKebTM15/+okDQZff
	OY8+nolAwIKu4nw10ZOdwgmrxIak4tv0TyRebc9U6vhqeJALvva39eEoeSRdnoEnJEEZ/67XeXx
	CZagEv+v9hMDWmssGjvThWoQtjcxTjUejsZT/hkMimd2imFh8iV77jHmOxk+9kPEU00Rza4fcuC
	uqHFctYPYMoS13OtbcYijLnKW5FKZvSTAUkVD0QItuotRut0AaagDO9XlOmfzkPVc=
X-Received: by 2002:a05:690c:6c81:b0:8b5:6873:5294 with SMTP id 00721157ae682-8b56873598cmr56191927b3.6.1795795665318;
        Fri, 27 Nov 2026 08:07:45 -0800 (PST)
X-Received: by 2002:a05:690c:6c81:b0:8b5:6873:5294 with SMTP id 00721157ae682-8b56873598cmr56191487b3.6.1795795664871;
        Fri, 27 Nov 2026 08:07:44 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:07:38 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-sa8255p-emac-dts-v4-2-f0c5a95cc6c0@oss.qualcomm.com>
References: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
In-Reply-To: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6596;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rhHs/EIeQK9WXf3OLzA7RvJ8H7H2PBjPaMvu75lxpKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarL2NhnKDYVkiRh0xcUH3NnMQmQ0eiUhk9+s
 aABLWG0iw+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqywAKCRAFnS7L/zaE
 w4tVD/wMwrSX+qAGvf3OuehCLMucG8AHEroWoYKqLOzowheeuoATuoBAPrw98cUm4uGd8yK+YK4
 iK2/QVU7VlZoVYxxhN4vk3MhiHQxXi8lAXLdWTFJoFwsQ9klZ5yQPwcodLV3t1Z9bEMEgbI788z
 bCA2faTzy7BSfpeW0yRjcn2D1NYDS5xouOBSGS3Yca/lgTP7MJUkH5rmSzkfESmAbqCT3d3XzwY
 lEX29pXiE+fAsa5p+wDUJmGqiUUwbaFgSjfdxgG71ImLMja08G+K/ve31EtC2yQSlGUF2E95TDp
 oWWKvMYwKgIDZ/VxeBCcbtB9fpZxogFi/iSEAkkVd9hrCW0KPfcTWZZKej9Uxrb7A25weXwTvi+
 4MKPvTw40WRs9UHZ4/8X+VVCozexO4OgCjfYWNcsPeuZE2fiFNJo4B7HgB3ynAqSxfIOwUuGYva
 tqAj5+cqWZE3dIAPfpEcKT+xo3KL5H9l13Urpr1elFSXRjECC7HNt1FLCbpXD7XOQ6znaGPIlRs
 bAfaBPkvEGn504GAy0aGgPdw0+5hCJV2hHUE1B+vyqDFDFrU+chswHrCNCMB1rW+mH+c1z1xXqT
 hhRkM+uC2Wyt+mWTlYma3TZNvJZZi1xVvNpeHG276bgoJng9yc+ahksQvqs8v+ZiT8rOSsfsRIJ
 dtvGWw85Wv1dYRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ZbbrNzq9O2OpPLU1lFljIFt4PBYJcsYv
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09aad2 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=LwjCQcZIY1nU89AU52wA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX2AjH7SRa5YF/
 CiKSZcUn3BJDe8A/afHVZL+SZm6XvfjkvLVjaciXA4Ue9AktkPaILyvbEUPXB+ofLPvoj9QgiV4
 4GWsc7PrMyUZWji48mUDQN3boawAbxs=
X-Proofpoint-GUID: ZbbrNzq9O2OpPLU1lFljIFt4PBYJcsYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX4iDS5O1/OiPm
 8+7S4dMm9IglmnvBkH86sjACJAXFwCBWluAy0UodNSeQLqJ30aNonIlfcyi0+K4EsfWhB5YjdLV
 +z6a4nD/MATWh8TN1+yDU59bRZL/Nn0P0RBoKdsey1kTaXS8upy7J8uZKWzmWGKF+8mib5JyOPC
 N1/btQeQt3IorMo1Smtv4wSWzAF/fr9CupTQEPfNP/9PFkTjexhY0IAGiIZYJ7VmhbgXtTM3Jte
 jXdwHf05k1N+j/sKSimCFhVdf9n2NFGTfW5OjKC4Rxmt/TqF7SGqrMs0QecRLxdw94ns9EGjC5c
 KSHKtu8Ga6e3VIVSX/Hp3X3iwK/R3dlohBAqd10DZygK5+5jRxdnLlrssFSsT+xvnFUItrQl87V
 m9WAVssUKlotQQY4E7kwR7UZdTyUPK2qnYNxsRzxncJhiATviGamwnEVbHTyABqFbpXkHkGfp7v
 PZYo8lJUPailPm8mlWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

Add the ethernet nodes along with their serdes PHY nodes for the gearvm
variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
EMACs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 199 +++++++++++++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
index 91c97a55f2787406b104650956b9a511a6a34c23..aaa8d96dfa61984afaeb13d7543140dd1724979d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
@@ -58,6 +58,22 @@ &cpufreq_hw {
 	clock-names = "xo", "alternate";
 };
 
+&ethernet0 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes0>;
+	phy-names = "serdes";
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
+&ethernet1 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes1>;
+	phy-names = "serdes";
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
 &firmware {
 	scmi0: scmi-0 {
 		compatible = "qcom,scmi-smc";
@@ -2898,6 +2914,24 @@ &scm {
 	memory-region = <&tz_ffi_mem>;
 };
 
+&soc {
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi7_dvfs 0>;
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi8_dvfs 0>;
+		status = "disabled";
+	};
+};
+
 &spi0 {
 	compatible = "qcom,sa8255p-geni-spi";
 	power-domains = <&scmi10_pd 0>,
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
index 6f19064997a4b50525fdf630307b843604368645..e40c811ab9f0fb1f0e5171a7ee6aeee59d2c746d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -14,6 +14,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -101,6 +103,171 @@ trip1 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		hsgmii_phy1: ethernet-phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -145,6 +312,14 @@ &scmi6 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -161,7 +336,31 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&serdes0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
+
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
 		pins = "gpio1";
 		function = "pcie0_clkreq";

-- 
2.47.3

