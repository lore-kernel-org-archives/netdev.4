Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463507;
	b=xmV71E1uvyY1ybbr3DZ74Bn6TKleZMcX8lhv346Y7JxmtOruo2wZtqBBk3Kn81Qe1CPS
	 eIj2WwqlGTQOCmzWLCV9Hpgxk7GBVFhdK5TsehawUsx5hKee7hpu8WEVWNNbwuO9y/io9
	 1fqQuF1O0Ku1zxdznviqxWpfIUKtcGiqg2r256PS+rA8j17xPES5Ukr2P0OCIUijbGWMN
	 Qqe6txX33QzGy+G77oRr7YBbVVKU7BFPu+8ktAnqJia4//GTCZ4hbaeXhhfKukJr9Z6SE
	 tk56swDYPvDxfLuw4COrQy7/fWZ+x5ewt2TIepS9FAb8B7eu1OkImCe1HX/ANSoH2cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n+QKcJBRktTYuBTAHW1qaej8q94iwupCVASXpAxjPkg=;
	b=iKXSv8tMYO7lAR105vV/rflgeuTlJnqUDBRTUAcWiGVeZmyaUIx1IPa1ZeSVqUmUB71U
	 SWeBHom2vOB6jkNhcAIPd07M4w5opFkLPgoqckBdIYyNl86Kk/vV9b3BpgHc9bAlrcFZb
	 WWOd8jeNzkBEQRKF0Vm0hyScXWcz0YCB46mfcHV3ha/U4128cZoRJ143k6giMxzrPdhZd
	 595n2/QiB7HGOQyq84uxujjRrpKMKwkt4rO/RhVubMEkRCdwGmOaArHB/HwIf74mra2Ji
	 iSjUZig9vxQej5Puolz4X5FpzEUQZagEE13gI82ttSHUMIlqROYNCmexjfwh+2EHsLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g8mejC/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs207oLo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EBB606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EBB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8mejC/+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs207oLo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNOej3440723
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n+QKcJBRktTYuBTAHW1qae
	j8q94iwupCVASXpAxjPkg=; b=g8mejC/+tDNHcOQeZNSHAUEhmaKbu4lCrNQN7D
	RQvWSFfTuQvVae1Ap00Yv0EL2ZA61atw2aAsrs/eG2nbwP2sV6uADQYhQh1xsIo1
	cZVRAS1yqArGmbmrgofdMFVmBxkCckzXaC1ChFUg/y+ILQG+wYId6RyezVwn7kVf
	J932ulVsNocU5AwXarGkaycqzPGZa5kL0EAPvmqagR2DMIsrVfjYN/ABdVncZh8H
	DeUDqUqTn52eMEJdBKEOs0nxJg0FPt3Xwwwrtj4T3naAM8Tp/ABE5R/4vPpaYwnM
	r5OFis4cCcTpjqmOppcfXUorWMMd0iVQ4krCb6veOFupVALg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr83n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:51:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5094037eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463505; x=1796068305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+QKcJBRktTYuBTAHW1qaej8q94iwupCVASXpAxjPkg=;
        b=Fs207oLodzgFUiUpF4f30aKjJ1aGvEj9u4q3LusdQHdqesz84u2YNq6bbCXFfR1Spc
         uCkFdDMJlCmix7zOSJmpjk20Fv88ztbt4i3NY30Dz9FTr9qNrUs9bnwOU7BeNeh8lzZh
         J6DhEnysfxrolxNUVNqdQrQyw4OFhM5QdHiDx+jBojeZ0+7/wnIfGMr49usLnFhM7+HS
         E0Vpuc6VKXLmPgpSAOPFNQhCndoryJuA4PVNrZJzChGh6jkVuLHaJjDkQo6fK3htVksn
         jI/JdAOTg3wQN4S5PDYJF3xq4zI+N4wQsvLaEZN4/quTaTXAnq6ikB5Sn3bhn8JmJsuT
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463505; x=1796068305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+QKcJBRktTYuBTAHW1qaej8q94iwupCVASXpAxjPkg=;
        b=uloWKBNZRUaR65c8nxzMu6+/9dybgWsfj2WiHui3zmFkfhaemJ96Msgb6FTBQINxsA
         mjy+a3Z9LQxyoMdNvnwuoPuNmJKXfv3/O/yEv2ypJ228vr3MOkdAxv5ipJcXri7ViPQ0
         sHWeCyTI+QBJj5zXaS7YITLid59Z6Zo3Av8JjluqCkOQZH2Jj1RuDU1xZg+lxOa7jIKg
         rTAkPRgjwTTWh6n3oY0pfZk0BRNrdJpHg0105D4upsJGkY/0lVS2xyZ1+Ht3YkLG/LZX
         rdyeTqJ8aKBtDzQ6SHa9kQpAdMFMygK+NA8h2B6ka3fOZQJbkGqbPTunhwuqblEZ0Gyr
         NIEw==
X-Forwarded-Encrypted: i=1; AL+hErHruN26ZiWt16n8kgaCz1swKsU08WD8h7gxoo2amd6LMJZtlMtUzqsNM4afDO20UGm2FSjJMpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jfgbJeBDkNAaytcIyx0ijKg80l72MmH5EiNOPLhVDG+BtiAtG
	9UI+uabmtT2Q3OyMuNNjCoLk1WZdg/2w2xAmyrNe8bUBZbWAKOtm72WYqS/frWPYMieZO/haosj
	JQfokSXy2Gq3EankBZ0icDKRTW2ELFSYbrYVicviZg8pDPG3RaQfhR5Dfx2Y=
X-Gm-Gg: AZFdTZfFENFVHlPg208lHvAFalctiG+hgEA0FndkqHRK/W74USDxsYRS/HExOjQ3Iop
	W/Tmdx+LKtp5Ktar7QZMrN2Q7s+Mqbpukwd0qf71n+sBsDstQApWnrCXa+Y40q1AtQeeIvg6a+6
	ykiY+ZFeP4qqRsgH4JZtm5GIk7nINXzIk1GkJIM0JtVLBMQyaWkBJCX+B8rTf+UYEmIL+dBdCCP
	nHgbGq4OwVC+hRr9fu5qwLjp71KRo+kbTKGFHN8VPx3/1G0bGJ0W4oMz7Otx/M4z8DVmL2BECus
	WZNaByvh5GHaRDJpG5ZdgT5itYkpVzdmUvhIK5wg/fsdRk8nv6lw2rdmID0Sn5XMOkxiuTQxXWC
	q3EQacGGYL+kijv4ORkAYgAGC+QuDFw1gy2zFkozfzC5LiUgihoKhxYkeE5v8PtTarySPQP6Ahw
	==
X-Received: by 2002:a05:7301:241b:b0:386:b526:24d2 with SMTP id 5a478bee46e88-386b52636aemr3280640eec.41.1795463505113;
        Mon, 23 Nov 2026 11:51:45 -0800 (PST)
X-Received: by 2002:a05:7301:241b:b0:386:b526:24d2 with SMTP id 5a478bee46e88-386b52636aemr3280605eec.41.1795463504586;
        Mon, 23 Nov 2026 11:51:44 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:44 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 00/10] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Tue, 24 Nov 2026 01:21:31 +0530
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEOZBGsC/22N0QqCMBSGX0XOdRPdbGlXvUfI0LNNR26zraQQ3
 70lXQaHH74f/u+sEFUwKsI5WyGoxUTjXQJ2yADHzg2KGJkYaEF5WZSM9BWZpRU43cQwC+ukWCh
 pGsYarpFjh5Cmc1DavHbttU08mvjw4b1/Wei3/Qkp/y9MVxCta1X1WMsjP118jPn92U3orc1TQ
 Ltt2wei4ErqvwAAAA==
X-Change-ID: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0CqXA8wZ1Ub3
 tEAf5InOMs0H82QEAbb6s8GZJC+vjvigzaH64L5dOQxZfsw+2cqvdOtqeCRSMyh+j5EAeTjZLgi
 enDqu2TsLeuDFspUsmUOO07geenyL1I=
X-Proofpoint-ORIG-GUID: tyD9immQCE1av9tnLgOZWSaeDF9spFFO
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b049951 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qz70-_R-GnIlLF7VpYgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXz5LsWCcaUIw3
 XM+vJoYGzhltx0/4J+BoIyMX5+inBwqSirtkWlRnJ144tzwG6uFXG/i1VBqptDUms3m8UizbrpJ
 va/NqUbpvuPDCDK+rljKPd3WKDV1Yc0kyd/8HqycfRKI5fA7/4NiZesyUI4Cz1KxfUkBUVHcp3m
 sH25/EDkqix/QHM1YfdDRqoiUCk8VkXCz8MKUeUxEPh6M7HFs7cvZ4LBnB8DhtXBGM1obfuFK/o
 ixNpp51O6E4YxMar2j46Qldj6mHOmQJBnIsxqgyj44e+jkWHRM8DqPC50ToUx0bx1xHXoZ90Y5E
 I5HfYdCE+WXtWL5ZBE4qmv9x14+AlB58FWB9fkfHTy8vQy1Gy96cwDlJOXmvmFSQaW+eFRlo1Ok
 n1Y/XMtr/tf+KuYZRPhAat9doEaOEmsHeLTOu4ZL6KfazyIcvhvVrA4CpF+40/tK8/okPO9hVjM
 ux1vRRS+iImLCMtzchQ==
X-Proofpoint-GUID: tyD9immQCE1av9tnLgOZWSaeDF9spFFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

The Peripheral Web PDM block on several Qualcomm SoCs contains a GP_MN
fractional divider that generates a clock output from the PDM XO4 clock.
The output can be routed to a dedicated GPIO pin for use as an external
reference clock.

This series adds the binding, a runtime PM-aware GP_MN divider driver,
and the GCC and DT support needed on QCS615, QCS8300, SA8775P, SC7280,
SM8750, and Shikra. GP_MN controller nodes are disabled by default so
boards must explicitly opt in before the output pin is muxed.

The DT nodes added here mux the GP_MN output onto a TLMM pin using the
gp_mn pinmux function. That function is added to the QCS8300, SA8775P,
SC7280, QCS615, SM8750, and Shikra pin control drivers by a separate pin
control series, which this series depends on:

  https://lore.kernel.org/all/20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com/

Changes in v3:
- Add configurable PDM XO4 divider clock, its public clock ID, and a
  GP_MN controller DT node for SM8750 and Shikra.
- Set the GP_MN assigned-clock-rate to 4.8 MHz (TCXO4 divided by 4) on
  all targets.
- Drop the per-SoC gp_mn pinmux patches; the gp_mn pin control function
  is now added by the separate pin control series linked above, which
  this series depends on.
- Rename the binding to qcom,sc7280-gp-mnd.yaml and its $id to match the
  fallback compatible. [#Krzysztof Kozlowski]
- Drop the redundant _clk suffix from clock-names (pdm/ahb).
  [#Krzysztof Kozlowski]
- Drop assigned-clocks/assigned-clock-rates from the binding; they
  describe the parent clock and are out of scope. Document the supported
  XO4 input rates (19.2 MHz down to 1.2 MHz) on the clocks description
  instead. [#Krzysztof Kozlowski, #Konrad Dybcio]
- Sort the fallback-compatible enum and drop the unused label from the
  binding example. [#sashiko-bot]
- Treat an unconfigured (power-on M = 0) divider as rate 0 in
  recalc_rate() so a bogus N is no longer decoded and the default 50%
  duty cycle stays valid. [#sashiko-bot]
- Use 64-bit division in set_duty_cycle() to fix the 32-bit build.
  [#kernel test robot]
- Order pinctrl-0 before pinctrl-names in the GP_MN DT nodes. [#Abel Vesa]
- Link to v2: https://lore.kernel.org/r/20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com

Changes in v2:
- Add SoC-specific compatible strings with a qcom,sc7280-gp-mnd
  fallback, map the 0x1000-byte register region, and document the PDM
  source rates. [#Konrad Dybcio]
- Use runtime PM and pm_clk for AHB register-access clock management,
  rely on the pinctrl core's default-state selection, and generate the
  output-clock name. [#Dmitry Baryshkov]
- Enforce valid GP_MN duty-cycle constraints and report high-phase duty
  cycles through the common clock framework.
- Add and register configurable PDM XO4 divider clocks and their public
  IDs for all supported SoCs, allowing the source rate to be configured.
- Split the pinctrl changes by SoC, retain Reviewed-by tags, and combine
  each SoC's pin state and controller node into one DTS patch.
  [#Konrad Dybcio]
- Correct the SC7280 output to gpio60 and disable every GP_MN controller
  node by default. Add QCS615 support as well. [#Luca Weiss]
- Link[v1]: https://lore.kernel.org/lkml/20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com/

The series is organized as follows:

  1. DT binding for the PDM GP_MN divider
  2. GCC PDM XO4 divider clock IDs
  3. PDM GP_MN divider driver
  4. GCC PDM XO4 divider clocks
  5-10. GP_MN DT support for QCS8300, SA8775P, SC7280, QCS615, SM8750,
        and Shikra

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      dt-bindings: clock: qcom: Add PDM XO4 divider clock IDs
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      clk: qcom: gcc: Add configurable PDM XO4 div clocks across targets
      arm64: dts: qcom: qcs8300: Add GP M/N clock controller
      arm64: dts: qcom: sa8775p: Add GP M/N clock controller
      arm64: dts: qcom: sc7280: Add GP M/N clock controller
      arm64: dts: qcom: qcs615: Add GP M/N clock controller
      arm64: dts: qcom: sm8750: Add GP M/N clock controller
      arm64: dts: qcom: shikra: Add GP M/N clock controller

 .../bindings/clock/qcom,sc7280-gp-mnd.yaml         |  92 ++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi      |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 342 +++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs615.c                      |  20 ++
 drivers/clk/qcom/gcc-qcs8300.c                     |  20 ++
 drivers/clk/qcom/gcc-sa8775p.c                     |  20 ++
 drivers/clk/qcom/gcc-sc7280.c                      |  20 ++
 drivers/clk/qcom/gcc-shikra.c                      |  20 ++
 drivers/clk/qcom/gcc-sm8750.c                      |  20 ++
 include/dt-bindings/clock/qcom,gcc-sc7280.h        |   1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |   2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h        |   1 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |   1 +
 22 files changed, 703 insertions(+)
---
base-commit: 96d7c30c51c0582a83806abba4c74e2c1344b324
change-id: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

