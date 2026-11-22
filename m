Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363764;
	b=H4CGNUUaIek7ZbEN4GkXOcn5OfXg3y9zCUmQLyBy5C1Zz5M+SyjKMfh5oUWlcXa6DGYv
	 j9gXq/Ot3UcqmzpdOAFMK6IjkhaPAPYBXk9yY5I99znzHzmV7pn9+xtwgg7u5xq18uo+7
	 dXmIQ0mN8WL0Try2hxf7wDF7viM13/eirVwxQMOxXX3VUuLULZ7dPNVWudsaMm2hzZsaN
	 ISqy7QL7C0jiTxH/FKWa0oUBBEY4QhYO0BFa3L1EnwNvANvkYON+wIyA4ityWzrtxWWNV
	 whvGVqkXN6kwZL9DiQ0pGlBF1rmLPjrxJj1zd6tQAokkP0X1gghdRoYVfaJU2mDmf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
	b=sjUQ07zkXqu+36Pu/xVe+EmGmIIhjdcFGhQQVD8VqNf4ZPD60PPc99CrzzH0FpJxZXtC
	 uxTjXVbduo1/I9QW1ylUyQQGiLXYG69zNOQGC3renMt9eqxM1kgtF50DudvfFDh5E7Hvt
	 Hn7wRHdvoqn6Cd51h5eZDk1U3zW/9ryg3Tu+XXprzdPzcyKn1bDWNlTRLLne2ftlgMcHU
	 VtYVF9RZzTRk8ToHNgGSuv+77uG1Ke7r1olJNNntZtlkf0pTWlLfoGHuFxAM2YE3nagRI
	 tFi0h5NnlWY+23cFmNBiX++RyVcWm16zEOCwWWDJe3Lxb1DIgvsfEo9kVdZRuIBwvGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mtAQdl0/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeZptIc5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D03606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D03606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtAQdl0/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeZptIc5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ8OA3787898
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOq
	ITaBP6p4=; b=mtAQdl0/VUmsTmBfCdsUiZlwtJktWhyrddSFvdoDARKMDsTNwg7
	1SmyLGMBNciWmtKHIeGNOeeL7ir2VLfswcIzeWnq2AUHdJY+pnkpSY/94BrU5QcB
	8z/Vy+qoCcJbX3P7yOc8cDdFZ5tgs6oyLFYEOtuooRiluGFbgzkNt5M76iLUw/FG
	8htUFfqpEWBHq0vSD/9fOQarjyjsezvEOVOk2Pc+CTZB0fGXKWbDOlhrsnUbXXI3
	cYNDz+ow+YeikSSxDtz/vgB2GJCBMXk8RZyQtVIaoZqC9wTGvLNjYWgh0YknlPbZ
	T6rUSEfzij8r6geVPJxujPz1eegQUn8YNHQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h33r0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so513988e0c.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363762; x=1795968562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=NeZptIc5x3Gdl7R1YrsUNR7gaLrT2n3hQn4XYyKfcx13nD0bdjM7nMhhEsa4CcNSOD
         HttxArABNmKyc5sP6/TrYrV5WjE5bYyqRVkyYvPb8FVDcqDUrFIdAOGeRkdsfIJbj6AO
         WSMCwrfNQYdLjbSWHtSVg1SVlLRR1m66yoTq2vKRcykj+TC8itUCRtu/lf2kdJur2Pi3
         EQtVh9YDmICA8F8DFg6cwsT+QmG17N6OwrU1kDcsP97GFszUeTWw6g0l38AsYbdmCJ9L
         WWLQcNATbUR7dG9B4lirQh4sf+ASZ4TzXXaAyCLfLGr80seWnEOS7Q5RnUJfcJNWoMUD
         V98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363762; x=1795968562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=f6F2XHd8nuFFkA41B79pjHyUaccXswGR460Kz217MJsBvzuO1K5Y4/ZCrzIVXM0PE0
         cIlgZFDBEgr9Sm5SpiUVIhTZEw/yjFvzYkjUiLynAawHOU9m+lVYFujrHFQrlXV0i2rr
         0epyEhkJF58AmlGpX+n1lJfCT2YiyixK5yth/bUHnvZmYWfWYTYW/4daaT7LE4Z+u99b
         d7sLVQ3yJvaOXAaxZAeCmWDZtel1eJB/KeHVz78riL0F5K5fY6UTFYjHx7lk54QJqo9h
         kprC0rcGF/V9GqbBCqUPg+jRJ0IKNWWYJp9CcsgVb2r9licw3KA5x6PpZyah53eRn2oj
         YSPg==
X-Forwarded-Encrypted: i=1; AL+hErE31i8Tm4eqA4Mbe+bTFvmsbkRuyBduwwcqnpNeyLxUGFbOUxLYOrq/bdShfQKc4pC969JW3v0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s6/LY+GfTPU59oo/TvbcW71Z22HHehpJc3ZrzbTzDzMqsPn3p
	ynQoKL2JQ+sLKQMoKDqBxVOgqu91pJAFlw67PO1oXmvvui6RVkWp0lGcrC4gc7hbvhu7X/Xc73k
	Oc+JqGcO26YTqhDFAhQX5TGRDikYqK8JCb9r43cPNhaJXOk53+eYnb3DinMY=
X-Gm-Gg: AZFdTZdKaz4Kb2b2J9yfDi004epNnMh/C8rHnNKrdRu6sTIWgZ7jsMlQlB1uaQQDEgS
	vA1jXweD3EtPWzIGqfM6UNZ0GsRL5kZFWQ3gNTv6so/mtK9kvbOYRhCBOiIqRwfP3Kbe8RLaVdS
	HmKaI/wgn8HL2BCnSdEq5Tok0ESfb1hG7X9Lc8GRlblyJ03K0idwrwcN/SeekSRlB5k+JrcLVZS
	3lOwz93IFwGR8hHYTJ74sjUQVMsJ91kB6hrbwK4KDqhsV+u5+XlBhDLl1pMuGQk32W3bWrzl38D
	f4GRQuP19MCsZIzCmwY0pRU/mYqCEL37O12IzydvicqTBTotfFRInUgVwm0SxHEMhcDh73jnaa8
	RUXWoJCbjEXVRne03k8E1C4EerYcRTVC6eKLKM2oOrM0pgOgUApKdNkKhDz38Nw==
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700284e0c.1.1795363761890;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700265e0c.1.1795363761433;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Jens=20Emil=20Schulz=20=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>, Marek Vasut <marex@denx.de>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: nxp,sja1105: Properly apply ports up to 11th port
Date: Sun, 22 Nov 2026 17:09:08 +0100
Message-ID: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k0dJnwwVOMUlPc+I5R+F03eCmWOTtijHmMPA/BB2GhY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOju/4Z86N0mMZw+6sMiO3a7sqHSvn4onpHC
 tSJ0snI4fGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTowAKCRDBN2bmhouD
 12p5D/4xaQ/IqdB5b/zXL7JJOMdwpoOJvhCY5xO3BhYDj2VfkgaUsxoy2xYJmK30cmwXITVYD4r
 kvQ2E8lPZVSNbkquqmYyv1bWwufE0xZj+5gPZr1phRuJyyactBViEXTcJDcagSilgixm/PTF+u7
 z5y1S6qnTXywKiLuIQliVhMXJuBnHjNxqLe4mLuljad0siZklmDDulm8ia9LjSm+zmKXfJd36RV
 dutmfs5njSG1lRa/cSDh3xk2Rz9U1SNO045QHN70NfTgRT7qpXKTDYns+QvbrZmkF3qg2llRcw/
 wE/p/M24NbKFYpFCqVEDtz9JgoId3ADhL/pR1JRovVXsb0JQAtpwS4E0cnkKbKC3xCVOTJnzjlP
 qq8lb0t6g9QAkFLlbNjd1gU4o/f0gtTYuAgGO8LmT3oxxldhJwO7WeryuFoHONCFAMf6X+j2ooQ
 IUAYKNRsI3DHDl7un82Eo13QGV7OSjGroEWz04mzkajrj0Jhqt50VnGuVynmaLPlNs7lM2AbZvR
 b7i9+JQSwFl2bDlHFZ8LNYXGgKjm3hkUYhhpEv2uEq8wCfoD1RS1Z2vNl7dIaY8dyhnJLWyH265
 WS5FNaYYHg8yyxtirYCjADcL0ofnaweqCxmiu3Tr1P43bVhROoiAxR76amWY7rPkK5g5roH2N4s j6WjETiSGU4vMzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b0313b3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1gOBQcDwdZx5nJ0sStIA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: SvcM8frF_WgH6Yb8ZHxIwmWW_G0P_OS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXzk3NBBap2bcC
 PsEBF/VDE7GttR29mlmVYExct4VLhMLrYT24JTVllJ03Rpb5tcI4f/A2OORG4G3UwVBuJlk1Y0x
 AY3lI/7odXPsWi5qUicRmslKR/FKbWzwyHpgrgSMZlV2eaSVTrWhetDn08b7Hq4QVx9Tm+gKim4
 w+Wfun/VBdDKICiBFeGNr8Gr7xge4WIIj6UzISZ7A1KwWG1ILY/WC9kBqbA/pb+fTt89FoCA9AY
 RorKFpxSpzsjl4V6aOCM5CukXMJxBOGuOb0VhepQ77yUZEDv0h0WfFwRVPf9fce4h4QWQyCjVIo
 BroLeENISW0EUl+hN+kQrTPwOzrEFVgpnus7Fa6Ycj3fJSg6JhQZePtijexN47PUGFQ5a/XlGVQ
 OjQzke7UHvegB7mcZt42/QxWEg5RC1wm6hj2McUhTDxqM9YlHiASCPVtw8L3oFrxnMurMN2vDkK
 J1iXQRbTtl29DdUyZvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5emAxSSic34s
 7jfBui5qBA0o3ZdFwvSwPS5eHp/ClvvjrWKaENIw6zWpShAi2Aoulh3GnjiwHBwd4sUOGPyWp1w
 CaDbr6rtyPt9JVubG03pqPed4uG9e18=
X-Proofpoint-GUID: SvcM8frF_WgH6Yb8ZHxIwmWW_G0P_OS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

nxp,sja1110 devices have up to 11 ports in DTS (highest port@a), so the
pattern was missing applying schema to the last one.  Fix this by
dropping the unit address from the pattern completely and adding proper
constrain on the 'reg' property, so child nodes beyond port@a will be
properly flagged as incorrect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
index 0486489114cd..e9b53820cc36 100644
--- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
@@ -89,7 +89,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-9]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 10
+
         allOf:
           - if:
               properties:
-- 
2.53.0

