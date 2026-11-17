Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905211;
	b=1ClvMJ4Myyk+x4GBQlpm/GyI3cgW9fHjuT8jrgRY294mQg7ZgmzKgdQ1eGPcDE3CkM+5
	 TwZ3SLKvbZo3c+EN5/R0+0PkFH05mGVnKTmDXnH7uV6fuIVTcCTO2NI/JiRKw64rH9T1y
	 EKe5HvWCKwcobrywigcPI9X3Ml+umOtb6YnD7w3nB3lWgQ531kVfa2pm9lUhETu1r3oAN
	 LbRL37YKdIYN64ZgrhvHCMwrO7p/+TuL+zca6mWlIRfH4u09ehOB9Jg2CAYf0FDH3jyla
	 u1B86gDJJhQ+Ar3eEk37SqxMt0Lb4k/ujVD//9K/rsIAUzqz71rJur3UaeAqpHltbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
	b=DZI4EuJ4HFiGfxotYL0UBK5AtlbO8ts0qe+PgaiphSlVWVoMuvYatuf/QtFIToR8QvyG
	 CtjznmiA9YPzDjFy3MMWOE5cct0x/MJcZQ2U0N8/eCbBHAlhSa3xLuztcOGROkSuWdPv/
	 99WsxKL33Zi5n0BWurNmBqJivaeYKnrEoXhPABY+YAlr5clOCrCewtHmdjFhluE8T7zAr
	 jAlgvBsYbCJcsrT0Z2BzQHhsVklPChH4u8ZdkC3Sz6zoxOYk3VEttmVTsvcmU5xWutD9p
	 LXs7khvoqb8HQSCAdYgHMOBXLItGvJ9UX1NEv8crmjY447IBfLJuhBVuAq3gHNDd89g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="URJIJk/C";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7F60A2606
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A7F60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URJIJk/C
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8OBs63624321
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=; b=PTeIORmfxb5eviGY
	z3VBVE5lWYUwUurjpxAvW/aDrAqS+NYE06SX37iEiOvSK9zoJCR1Odxwh7LqcHZF
	B3Dttx1axsU1BPhRXcYNJ4xt3j1ChYFhnzoK6V9yGEJDIYCawZ0HRSPBHjdarVvi
	2kAcCRbNxzg1861zDQ5Q42knEwSoxYAvIOsUVIjAxg843OI0r4v65RVLWofrKIFX
	eQcRgGxEASubP4AuQ63v/EH5adsuFvNx44AIRsCaBDME/nUU0WaKj/uxsizDDkHx
	7MHnlrfFpV9DkBeD1Ft/zymg2eZMZpgfOVPa646ZJTcDIP0boEbghbIfDXHNXh2p
	SqiZmw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejpb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd97f89731so500037a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905205; x=1795510005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=URJIJk/CTmhVRLQ2uJzFw6FrGers+XgrWZX5KCQsvfTxmh9HjUFhTilXIL8k2Mqw8/
         09pQCXmvgJXq9hShC928b5E8fC4/bQzQ1fVC7t8+Bal+u7dKqaj+1Plf6yaqXGbixPYB
         ZoMDdkQWDDNWcajOn9CkuZRmdBwVYeSL4tHIDRc2fNKWORy1P0RzHI3gMXlWUWLclRN4
         pCMhH4S0SJTxePYgelrP1kSNa59BqjD5Pmrv7NOl3o0EQPyzhFkD7jL13oZKzsrOXbdp
         gU1VcOAV1tpA5ys0H/Ny6XjabxzwKedBCCcpZichGFkMA5unS17zjtMjJkTF4Imc9FWe
         Mpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905205; x=1795510005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=kU1DMT7BfQ89dWSoZsHldNB/Vhc4l6TFCWCY2fbiftXcP5BjM3waj2PNZJBto+Vnny
         x3Lvgp4O5M+5YfXTD5j+pFnygtd3kjZ3gYe1f/1ReZje7e0AVBxvpbgBmYrGYDkcjAe/
         sOY+UMxlsivQ+4E0+nxqjNAbTLgnQPlFgnuL4OMW8grqqzXKkKT0VqODmoYaWnmP2I6l
         zz9eK/PwvVi8q6QgAcY1a7pU/aHz7zrHYY0QAqwrNhF6lunfWWu2vjZJIUYbIFlUWqrA
         IL/YenZFMr06xAULb4JGujWzfycnHicHd3aQ56jQ6vyc+IH12zaFLGvrJNEmrvN9/Vt7
         PijA==
X-Gm-Message-State: APuU4Z9wZJCLRyEIAPXFBZIhvv/bs096u6Mdi/u22wVWzkn47e3mn7ry
	V+6LKtDOLI28yCGl+3dSHjODaIe05ZD+plRlGjcbsKFIf5N7UTlZ6TZ7SFwIGX7fBfsktI9Uz6I
	fV8w1D+xIgj/CKd0wbCzhqJt9bha/+bGFwDec+esDJ/CbeSmmHdJxWAXLom+B1uDcngA=
X-Gm-Gg: AYBFou1Iu33o4QzUhUsAZytQunbmqESPOJ3Qllj/3R3WOtNbIhvHtV1lshZxSINdRML
	ho8tN0GRGoXCq4uxRAxVebTvy4KDc2dykY4Zt6HH2QqOCWCQ/sDupmuj4AliSSUXsRfwh6DmL55
	KiFvzEg9/izPbzjb+FDyXPuXpfrtvuZ3SM+lRv4+2SZM8yVtwVvwzKJrNT5n8Y5j6D9uxMOhan8
	hRWWKLtooWLjVi9pLTVSB+AciQLceXmwrsWluvUzALT2COcHOGQK7NwNkop+798u+Ixv9T0YTKV
	WM0C7xswyE8QXXoZ8WpciTgXrmrdsgAg2nXoGv96t4pO1YJ/D5nkpVMOc18QuHz7IPMF1neIjnV
	JkWsm/Q/0wd4HWcz0/ypbrz/8oZlajWDQ0gRDxEP3DXRYl8N/JArTeFt/K2JKQWSJ173SmxVai9
	82eQ==
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539552637.24.1794905205188;
        Tue, 17 Nov 2026 00:46:45 -0800 (PST)
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539524637.24.1794905204643;
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:26 +0530
Subject: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
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
Message-Id: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1511;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=RpifxHIohWwcF3nhiLIn3gCgfBa+VybjsdQk7Cx2Trk=;
 b=LRDHro7v7JC89pC7fis0z3esT5dgan4Jacy+s0RcqgazDgOabVUBiBt+r1r07PWd7aQcMyYNo
 yu5IWG77AJ9AOFi6+o5QTuBYwU8+Jpd5ORfpMUbcU48Qf7jWKisFg7B
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXxv2YPK4AG9yA
 asU4mWYDaATXjzyVHrkJnihG3Kch6aeWvbIK5jDdHOsq7wxErtuZ2IdiBJsZUtz2VPSwUPpZOF1
 MsN3+9D3FSHIpG0WOaJjZHgql5FsFjk=
X-Proofpoint-ORIG-GUID: HjEKH8oXQ4B4Zv-Bn2R5rjvPDNSqrnqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+tF0N7AQLxpK
 JZuLBBTGysqbYxyMumX2qgD6NERle3rcFvKJ0eTJovbPv94BiyeYszfCIUH5S4RhUWrme7CyWJj
 TUHYZ9DMs4ldKPuEGfl2tMjiCXpz7joN85kc0I7P/aA9lUTRWF2m/MQSkrUHxgJbGdl1/yvOsAp
 DU0pqAhGtHAJgMLRFe9ymvt2Z5r6n1s2LlFKe/tkMzEdBjZCU46LvqImbgJafeMnkO295JpcnRs
 C9VBwBJjn9vMoF5W5e1ULo6oJ463LDr/B3oNpEwrbi2QWHI9IsocLahSeZ4TmsikeAKCIJfl2qT
 NoTUb6WFIAtvpql6fYQEXgQ5ZjTOcdcZU+FRJJvgI3AUFpEobT0nYCMoCfaa6JbN9iGw2JpPmW+
 8qbhn9Tx/Pf5OO2CbTSqj9X8t4+DJ2DsyEkEULdODlBQ7nMskcir/G0a9bOh9kaToJJoNAsenJS
 pQEvpqA6CGJLFy8dqNg==
X-Proofpoint-GUID: HjEKH8oXQ4B4Zv-Bn2R5rjvPDNSqrnqI
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc1475 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=pwD1iIOGdNV7nma60yEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

The DLL locking is not affected by the current clock rate. This has
been confirmed with actual hardware testing as well as the fact that
the existing code performs the DLL lock first before changing the clock
rate when the link speed changes.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: add some details in the commit message to address concerns raised
by Sashiko.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 99ea7e0cfb00..192788e00dfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	if (ret)
 		return ret;
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 

-- 
2.34.1

