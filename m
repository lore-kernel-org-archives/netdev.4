Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905197;
	b=ou2xymoy8Lha4wyRdUKV99azdZM6ghkyy0ClrDBohxFMm/9Klql6i1AhMkDi3y+fLXgM
	 PDv6lohYrvUbe9OOP47FATcRUOcxZzadre6vtDF2IZo4A7DaSjDPKc0ctLw5fcYYZGq/g
	 Q4UlrBKK3lHmeUnZTvM1tOlgXK/Xloniq4802p9a2CmF75ZD10Wwa+EOrxNqVk7KtMGNH
	 ib6K3ggtTxW3lHo/fEuoNqyWPfSBCYQ6d7O2n6XDkmAW42vaPxkpGKOOIg7+kS0bk7F5H
	 JowroYJNfUGl7O4+gdDVUiyxbZI/2zEkCYtxq4wVFDzLPcLyfYf9PlajRWzGNv8FPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
	b=snbtWkNdGSEgEAYOZnxDa/pWCXVHihvnVnLoirA9zoTqWOA7x1n0Is4Jr3j8RwNiguyM
	 OZFzMUVhZGbCjDVqdo58+hE1YgEBtOWpLZ8hYbfa+w3eeUtmyiK8xV3kM7CJJWd+MA6KV
	 pj+LvRDN+hb27eeqVgD+9zGT+kJoK8taEIwrAzdAMmyotX5z4m3FFbavDaDCZ29JdPPZB
	 EGMPD7E3z0RuDPx5pN2M1Gd2p4RbFxJefzkOb+f25sX9G98dMkOseBe+Mq/pdsGzFt23x
	 EoDxd/i2JD6E1HZpPucdE6rAOpSmg0zkS0TZ4+COirffqxPv6cBX6eXWk1oDtr4yC6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5159sHG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACEC60A260D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACEC60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5159sHG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55nLL3350408
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=; b=WXp8YkAfLNdBX102
	2b3V5vWFXZCOY1QzwlnF/dlNFGn9Le1yo2w7uog/MdPNGYyLa5yVO1vsOorCAu21
	U9DhTd5Isbqzba9iodGbWVYpsPvOhTyudhvNDdL5S030XsW3hWlEPrcHROOubwle
	qzNWy/Cj01rXlBF0mP9a0luAWjc1+9rz2fbdhx+Y2lVVYrDV6426qIX4nNhYzmlm
	IEZVoKxZEu48vXxDTP11ckc76eJi8ONs4n4vBDYDuo9j7V6aWVN8nIRHYs7VB4Ym
	0pKljB80K+DxUk7OKlUVeICnMZXxiXcgBn/5zgdZQ+neoF1rKtdgcf4ALPHJv8Ki
	ZQA1TA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0sfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2961818a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905188; x=1795509988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=A5159sHGM2cxzEd05P4xfNynbUYrSI0jqhG/O4z1Ux/Re0lvYzHOM7cxQit9lHVBuV
         e5tLOfemBr4SGjATifWrUEZ3M6+uZfjbOVNq7MccR3kcKbGtE6eD41jclFyw2DAGDrvP
         jWC5T1UAEh+Tbfz4gKSUvuWarPb3bL/QMEUjbWH4gWOb0pdKaeeCAVHYHgbZHP7P29pW
         K0FIOKo5uhDHPhb9eiQalAmxH/YJO6YlkNSTBZhAb7JyM6hJnymRUMEOiSC0DKXsqdlD
         BG/WGuOFBYor8kDhBWOyPq/srLq8py0MvQYmDDOPlnFtgapxY6r5dtHhbkpKhkkqNdVn
         v4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905188; x=1795509988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=muMWnoT8MafoIWgsKDqeqPg8b8KQhkK56Dsg6KhkhUhGcqj/wXoOORVJkPMKhga61l
         hu5I0OhTMMLcLMHZl6tqC/H70VkYBD9vBWVt5kfd6ZvhDey84T1nFzoeit5+hHzUjaDX
         zCFK26GJal6rdTEwhKpMPMOgL9VaEDwCJuPDETRK1xBDQ8bvtRg2749U9FhXTUvYwjK4
         er1o1Qmw+jAV7ux7xLwQ9K5AN+qDD+CGqInP36fopJXEZkWoxVKzA7MR8ZsuBVziZXYL
         1RQpKYzuYCbF9pTZgxwFG6Ld10bb05gJCHeW77ZKZJZHa3lBpnJwa6klbi3OKcM/N0/D
         2QpQ==
X-Gm-Message-State: APuU4Z/2JO7Jx+2Zf94YOvieOm9uKfduwe126Fhj02Oiz62Mm/7V1GJN
	evPZSak9dAdzClNDUldnKjOJipIoQTeF4Ii1wCPZ5j9L78tFZ8eafbqAAFGNSV3VFiJgVkm40eE
	Gz52X91kHIZUwJcAYdRfn3H0aKU1FfhTYcZa2t1xGBjSvdn1OmwhPKhJChH/CvnfS6oY=
X-Gm-Gg: AYBFou1DcOye4Lk8b+CTeKveBLM3NXt5QuNm+FGD73FBzU4CCLjvY1rFqnKUjTrqCGz
	Ep3chMajWU2y5oGbDiCKkw4xMg3AorWnnpFTiU6T1/wQHQlksNPgVr2UPpPPdH+hgvCNCqAs3Zj
	BQqCl3sUVAaxUEahE5ol2NdL0aV7rqgFJNq2lHnJn6O9+Gt+/PNM1xwZBMcUQQZvf9lECsadIzZ
	pWMhx9FBi6ZemPVAUXAo+i8938LCpv7PiAzM211rnBNUL8DCXvUDGxUBhUB1nnYn5sD4o22mJh7
	f2fBmmOTviTHWkD5Xm8LT2RVJWfL/XtifECkYiVHfECK+DUzDOWeWiI2h0kCchvZ0VMO/QNVoA7
	rxtroWksggJBVkGOZCZfD87ngifGqA69cup/RRO8ov8dPlTEtUjXz7JjnUXEshuiJt2ahSe5uWy
	Ypow==
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182577637.65.1794905188159;
        Tue, 17 Nov 2026 00:46:28 -0800 (PST)
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182547637.65.1794905187603;
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:24 +0530
Subject: [PATCH net-next v4 04/10] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
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
Message-Id: <20261117-shikra_ethernet-v4-4-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1924;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=h8iKXwGfP4z+zw3C5X6I1w9ChDSEwoK8RxfNrBe96t8=;
 b=kQD6/F8/rCLDa03R5m7H9YJ6yMZIibUFFYNTVT4Zn796GNjmnhaMoEYXuxPnHy634R57WVUR/
 DSZdcFderHwDrShBS9akj317sJ08LUX1Z6LInvVrBAUvzLKN23VSJ0p
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc1465 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: OlwRUzGB-wo3bBljJpXXXDxiocpryBCK
X-Proofpoint-ORIG-GUID: OlwRUzGB-wo3bBljJpXXXDxiocpryBCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+cknxwt8AMtj
 gk+snkGSQeB2cMRajo85irUHt776GhjIQnvzyYcP3a8JzioCKS1GKswGFaE+PUbggI65IrmJeLg
 wFMGpckBgNluNIU0GLyCp00w+dJo/AiMbbavsYK+b5WF0QKhdzzOT4T8do1qbzX1er7qKYOShby
 VYzkuWdin5r0wn14t6uE3Pfxviw2KRpIFv4lAlOx3p+BRW51pT63gYL092mxaPgGfpLB2jXuuh7
 JGPVtOhdjM2noCvfRH7pFgqzJ6OvauzqtOz1pf/vMS4nbzT6P11Vtk4VMAU+KvQzvAK9e4YenqT
 2dX80GVRy/2nJ8GZALRkUFRGxqVI5Is0xEA0puYbaUvFCr38rPR2WAY6a5/8Y+BgJ6SD+Nf0ffD
 RcXXBtDwQZC9jd1e6DEK7yAf1Tevq/ZlyoQGWP1RUoUDF9CY+KNjANEpd8cUd2HaUikewIFP/BL
 MA7r20ZdMJ+PTDr/a+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX7VPa5ORF1mSN
 0IeBzA5lYPB9PFGsN0h8MLKOFwcMp3pXEzv7MqBQEgLQApHVi4p447bkYw6I3S8FQ4sxzadFrg6
 +yYwbqt7fkPUuFkm3TZyjXgEls69RpM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..f2428f0467bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -411,9 +411,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -424,11 +423,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -519,8 +513,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1

