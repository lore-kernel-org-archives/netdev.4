Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431227;
	b=28lCxlAEQvtuYM68VE7bMYug9cStyLku/u4NDeLKSPWZbe4DZtCGvLDV9xV1ko0OXiPS
	 IDVQxcHZX0QtFXbKWmvHFEPTacQpZtvVXZJ128oNrtjyICmf7gN/buIcpujYQP02Ior9P
	 aFnaHkjCvhpyEPckecU07gvVz6/zwt1YGN1OGprKLYBLhmmOkT0crUb9qSVwFQSk1BJfU
	 NXAEpDzMLn6XCOfT3HpR1FIvylBAdw4iD2MdBL5RoD0hPSIYHSbl+QyVP+GG+KBiAu/dJ
	 7owgKe580kvwfC7K456OTUSMhJWiqxg68UxV9wE8LZXbvC+gXfUJK7ird3WifVbxZHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=;
	b=ssYMJ627Dk5fQ2Vr/blMyVQkKmBRONxt3be/tFegGf8FvA6k6pOg8NIyyw459qu3ZZv0
	 T5ryKBNIJH8Y5jTZJfLIJbe1k8PSY0qNuIuDKXu/z8yIVQ0rWQpD9LmezjXv08ak6gGuE
	 1iBRX+164C4j+eSmZA1hBqW2MWnmDO4pOofUpXX0dfFyrdAgqITyvLNAbfJrYRVxwEwTM
	 h06rAwWriRGuiUf1OOi8SEuQPtux+URXo8jVIFA9bsSy9KhEw/zfPt7EZDP+9NQ3g7efx
	 AGc/9ek3trJOJrAOREI9jybEPoUOv7KMQ93m00JUEPiQZB/6dctABVJMI1wa7Sd+pRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVgR8H9L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHOHAINK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E1606A690
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178E1606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVgR8H9L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHOHAINK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GafA150206
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=; b=HVgR8H9LKOp8fNF9
	v8YaMJs39dHgBhrWnzsYX653mQpJ7jca5Ygf91lZ9G5R0N83L8Ikf5ONH0naphpD
	LI0CgvSmg2RV8LncKkyz112li/shdXZqQDWpQkrIDtw14mJoTO8/1WHYuctrTRjm
	/p0xOYC36AlMO6MFrHAmW7aer7L5QaS+VyTD6bj0HRw31JgpbQr2b9hBxG8jVPT0
	bRX/8p+xg09GTDDCoY9Wb1pRs3SvCKZB1CP9qmypJFrTsuG15HEIXZl6Ec4SN71M
	jQpMdjcUGJVr+NQvXjFE1xSzpSzYBxCfY7DbtPWb6K8g8qor95y48+fdZBX5o0qY
	/xwwaw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk6a5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:53:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso2324500b3a.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431226; x=1796036026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=;
        b=LHOHAINKp/mfRXxnp9yhUUmpl+UolH46l8EmbsWTJQ2noXqL99QiFag9mIYnThmsso
         PjNTFVZj0/zQB0TH5ocHPBG8gfWKQRqgMRqTqd3jUzpBcXw9PJXO6qHzIEGU9SLhikYO
         aMY/TgaKvyyLGDc9tsTOcAYiWwynZJc592W3DTxD+wLyfA3IVl8GJpOHekUDZjGlURLE
         zFiJHRTgN2osGS2JN11arjT6pbbd1rcPCLwDNH1EE3iRj5kfSimEtqipMAVcBuwzS0oM
         5rsJKR+sjbKxKo4imyqUrxHH7GnqenB3c1Zb8l+lH4zD7gkT+vtp7TNt1JNIzvemkKnA
         MiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431226; x=1796036026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqWmSxW2+RkKPy5DIvxRON+6b5SomRLLEfeYUte4pWw=;
        b=iZObExlOWKwHRxlwEfMVsTfahnpXCMM0FQd5chRz460WkDpbnD8HUW8knsxKJU2LHe
         08mQb/M76kCEBp/dnP4nLr9hjO3VFMfKuLFLBMQ38U5t1CJePWRGVm30jVrrtlHdPTUH
         +hx4BKOo/cLr2/kuq4PEDiGqBY4D4jPw9SHFo06Mh1lDpAI/J8la1W774HRKUIfQXcJA
         Y3b1FX1XQPmr4PeP4ygG0SALM/+0ZzcgBpgy/qoa/evvoCX0ONnFmLFwPUtewITy3Lq0
         PfKhwcSpjIn1PuLyquykHOUXPH1nCYh3C9k2ZR+86ZxyjP9aHSoHfcW88eRhCMZDazm3
         9WZg==
X-Forwarded-Encrypted: i=1; AL+hErG9/gGahqvMN8GgbLZ9MVJXCaIZ+O4fCAmRJBjEmdsfilZ6dmh1yi9LwsbcGhy4Sdg1HN1HRGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q7x28RWTOeA2GzxPUL27JLfkyrQOmtAdyO4poW5OKwsmccuIw
	aDvrxUc1estjzx8EGRK56eDn2h3et0WNiWMTi9Ny7MPfcN2rJTOrlXzDZAqeosBb46kM2XARkKm
	pymiDXwVVmDN75Wh+3gz6XWfOqGavJJa/mJKZBjEuaFrjm9+U3Delw2gx9LE=
X-Gm-Gg: AZFdTZdfyCZc8AUB4EbqCiyNAmspmBkUzVrHI3pdOUh6RMr9pUDGqx7kIXdA64+8ZVc
	GJPP+OvQbY7Rk8M21n3zyIX27hS7zVbAMvRmoE2AxhDsOicnUaRn4wmCH6VJy0mrX/LI9lbi4EB
	sq6fuhGjDDfWlD1/x7srESY5jmBOioKTLo9zsekhYEGbNe14eQIYuLgcXGPFLdYej8c1a8PGtzI
	BNxg3UvslqYJdHgRzPzqHsxMss8WoB6ruiTIjwTXeHAFC0sg7FwTocq4ZumoxkjhJtoDGPznpmE
	OzvZhb0paz9AAQwlpUepfm0n4Tcvat0qdOCZ0N+4HTGKHA1qFPzpeH9geZ64rMAAs42KP20cykD
	ITv6q8/o4+x17+c8R6ckOxV69HYBsjrP5PKouzWoP/ejjg0K2sdxprnCFpFLGI3UwG9icxiGGKU
	iQ86WL3ZpcSBc=
X-Received: by 2002:a05:6a00:179f:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8c87daf62a7mr9158310b3a.57.1795431225454;
        Mon, 23 Nov 2026 02:53:45 -0800 (PST)
X-Received: by 2002:a05:6a00:179f:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8c87daf62a7mr9158300b3a.57.1795431224904;
        Mon, 23 Nov 2026 02:53:44 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:44 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:11 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM
 platform
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
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-2-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Kishor Buchi <kbuchi@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=12041;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=7CMwlDa76MqHRc5vzAm3rhTK08+kxnhgUqfmJ9uDCXE=;
 b=jBxgK/H7pIKPWRV/+Qu4sVyz3t+4RUQHQy6z2i6y4/cqFnpnr211cHLXwFsqMJI4AgEVtaqhV
 0eJcUZ9BumyAIoY0ifvuMuRSu5GTD8SIYJUgEtaLdfWqdmx8kKssa3z
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: 600hwc6UXo0WeHKNyegbqr3n_iYMluVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfXwWvN/CqoIvhW
 m8CrvocYXm+m/tNpGs9RM2ComyY0WdNIZPYbMgEaIoUa+en7Muzmny/Z7WaH7jzGfo5K7QBZL4q
 hnGYd0wVmR8OP9P2lIL0HpPBVrWsOi2/yRPkuvo8exYSQ8mLN5zIbHIwF0pEA3GIr1AQEVMr8aE
 hz4RbvuC0qenI5BT8SA6MxrsEE5Um7DonkTuZG/jkN3OlW0gRRxOcI9RE89I9kNhBqP0DtcqWoS
 GokQiBpQJ+G2kqYhjwf8z6t0C0a/oqJgfkd4GUqxvu5C7Mhn4BeCQH7/jmyi0fjKEfUsZylEkov
 /Nm7HbSgOvvRKai4OaaSP9AMMocWgbm5/TsMc4/4EXkgTtA5XK4NFLj67rJ/cAmXrKUTmaOnWxm
 u54eMJ1WITDJF1QCSJuDIBzvjjLSjL4BEPpFwSuUDeWkYqcWfdCDXsFiXEXCqVZ10GBUORXRZaE
 YHm7VKvcBhKiaWh7xYA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b041b3a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DPbrpyM9rVPZFICIiCMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfXwU8uRFoepBQm
 jUM29S4IqS1xiwtsQatBDbUA42fOehGmLgSXtURDuulASbSyF8HMYYnrRjQY70I0p1SiLAJirfo
 TouC00UZLgRetW2MMu5eRIqXLAZ1kNY=
X-Proofpoint-GUID: 600hwc6UXo0WeHKNyegbqr3n_iYMluVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Introduce the device tree for the SA8775P/QCS9100-based LeMans Draco
EVK SoM. The LeMans Draco SoM is a compact compute module integrating
the SA8775P SoC, three PMM8654AU PMICs, and essential connectivity,
designed to mount on carrier boards.

The initial SoM device tree includes basic support for:

- RPMH regulators for three PMM8654AU PMICs
- QUP firmware paths (qupv3_id_0/1/2)
- Remoteproc instances (ADSP, CDSP0/1, GPDSP0/1) with firmware paths
- Debug UART (uart10) and board clocks
- UFS storage
- USB 0, USB 1 (host mode) and USB 2 with HSPHY and QMP PHY supplies
- GPU (Adreno 663) with ZAP shader firmware
- Video processing unit (iris)

The SoM device tree includes lemans-embedded.dtsi rather than lemans.dtsi
directly, as platform resources (clocks, regulators, interconnects, PHYs
and pinctrls) were moved from lemans.dtsi into lemans-embedded.dtsi to
allow lemans.dtsi to serve the GearVM variant [1].

[1] https://lore.kernel.org/all/20261031131042.1200862-4-shengchao.guo@oss.qualcomm.com/

Co-developed-by: Kishor Buchi <kbuchi@qti.qualcomm.com>
Signed-off-by: Kishor Buchi <kbuchi@qti.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi | 421 +++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
new file mode 100644
index 000000000000..1001b6b81c31
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "lemans-embedded.dtsi"
+#include "lemans-pmics.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};

-- 
2.43.0

