Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905165;
	b=LX+pjx9SfaZq0nBaIs7kM76IOkVKYVIeH+R55rz2PZUfNVRoPwzetNLaWVrDcYN0lJYd
	 hf8FeEUXQAFMUBy20HyAJ6XViL817tDa9ytgx0b/mxtLBDkJQNjO0SkmQMmoPiTQ/XAU0
	 ecvzOss65MBbuvZ6EvRHRatN5I8NkYTzfublaQoqJLRra9krJ0FgXjdCX1o9wmo5Ar1er
	 7xevqSYMra8ReUjcLXAK5sjF1aiWw15egGwDL4NPscYXzY6ArszDafDqxA6/TfbDuNAx/
	 1+pyN/sLkHHeOKtbpGHhcGAd2s/35Kgn+7uEMLhngpTdVR6HFjQeJ3jj3ZRs3ScDnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
	b=kamULn/1xUSQlch0Q9GdSMpFBYodiTAtfimES6A3+fIalhwTnd9qOx+un4hSABfeSuOe
	 pj6bPlP+c71GnInSB5sQmYV5tuNGtRcZjDeMpYZBitV1TakiCe3EDyOoxZAiPaIFL4fy5
	 MD5w0jbKnZMn77JHwnOdIAVZEjzbCSsK6aIiJuc/8Qt3p4D5RwZ1W6cKYznoywcZwFxlz
	 3kvuGKwsqNmroVPnU6S6jbBbFhRJyE7PQ5eqbncrhqWuY5USoZ3WcJzYd9nJLk4jWI7Xv
	 DFs04l82y+NJ2uOxxIoslPwtEs58ZV/8O/g0THH6Z0PZwbEgMwdyymJTXpEACSg1/Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q/rnF6/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK1Kk2GB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E42606A8BD
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E42606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/rnF6/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK1Kk2GB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f1vK2998618
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=; b=Q/rnF6/QYmoq0Fp3
	l5EArxNdwZ/4pyRKzw3wdqxLwoeL3EIwtX758TA2dtLtcZldx1uZXIgn/uI8Uhg3
	iZEbWY8o6ybfVTr20hDbMZjGJf3JViCf0Q0nvD73gkTNPJhhFp/xnGVD0mKuAGJp
	x1z7Z70d/mMr2NlZDy+HNwJ3nsEaDa2oXrN4jOqwqcmCwyR1iPop5e915Bct9ZWh
	EX6QPoF+OdiKzQ/kshG99O/qnGfgAbBKglE6CUR1hqB3drmDeBH/CS62dI6u8mMX
	CYclj77C5qr5YFA23iNwl3vBOxq8pjVdCHydpOgmFQWK1+eSh/A2CRDt3RrSA4Hr
	H4Bl4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0fx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4777859a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905162; x=1795509962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=IK1Kk2GB+mP/f9YnL4naocz/yWFyR5d0sNvGIH8z/WUPPxCqXvyOMVTAOuPKDf73kh
         upPmQ1Ly2ohCKHUult7uvNH0pwXgJZgij8HDCcW92wbXi3TRV1oaxXSn9wItR1YZyfga
         1DKrLqLfJ1MY6rP6ibuFSjluVWA3DL3hDnjStn8hpppi6zf1NyiJwB480QullZ7Two8f
         X+CqCxdkmUWMMYFu1d2n/ReUWZNINcuTFFFpHmXCPf5HVqfpCrOM/NOysyRp12dTXF4M
         3Marf5dMLGt/dv9yZR2iiaVD+oL981L+GHb9GJQDR4UPoMm6FLHfEUHDNyB2E0n9fo7v
         JvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905162; x=1795509962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=G6RnbXJfpUs4YWSR+hrBQxnqx94+qNwhKkU4BRIE5RGb7eMivG64wMKHNJWuH/Jwph
         yk+QPIbPE813RLJjcsy8lmRwiRhIBwO10IxY1d36JiySl/toVxbYUq/z+Kj5Xm5OBvU7
         9w0ueBGA9q336e4QP718TpwQdBnVqN9b/tvAn9+lYRwApWr7Ay8C4cK2dfCJUSOpfUMu
         ftmos1pQTRWDH5NsP91dwF2YH63vZr84CeGcRe8sEVX1HDYfcA5Y906TWyh3QWHR6Arz
         s81I3WqPaFLpn91Gp0wTapFdNjtC86CZ6RES8vnfi74kNo502WvV9Yk6DfOHJzznfCWD
         RLwQ==
X-Gm-Message-State: APuU4Z+xV3EQcEtkskKBF5ktX5GMCFwgtqWVN11zFgEhQHeYCtRLudjh
	/zycsL2FV9EMhh9GZfw8yRtWjFHe9OSQJ8K01PgXJbI/iLwQl9xSclBfnneAKOyZD40u91xxYX+
	MNxvLA+Fpw3vpfTaytiNo+TNzoM1P7TTRMsUBt4hZaXs7DwWKM8IXCgZFz93kCtBDk/Q=
X-Gm-Gg: AYBFou1hUMZqm6Dsd26V6J5H8JzAaK+9+48jtopWg3kWb9sul48ELf9yXRnMtjX4SNZ
	hh7uPhCuR6eNzW+GI62VaVpi5SK4dDWtoP/NRieBXAoAwqfz14wg/fBT0UQUfHzHGBQkiSl/mYw
	58nSHHEI51IBstLE6TggSJsivO7sCgeNm56jGDHyKMOCK4pJ3bYbpeqRVrY948UJvcgT4xtxQOH
	7Hn1D5XXNv8jniWMwIks4wKB3FDhE9YXwcwT4JoKZyUQZ6sA/A8XcuSZu8va0PJtwpg1PBx6Ujf
	lkcuXtSecGL+oUkRW5kO7Idlzmi7iOsjEkDemv31B3j5JdsOzfYfwi3vYURUOSg/hVY5pzXJYgz
	aZwbTO4x6yUS59218cI25VYTnKXEKZKgoZE1S6uwCAXLhEU5YYJp4bllMrkOe+COWWdDYLWBiCi
	5/9w==
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500676637.9.1794905162402;
        Tue, 17 Nov 2026 00:46:02 -0800 (PST)
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500655637.9.1794905161882;
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:21 +0530
Subject: [PATCH net-next v4 01/10] dt-bindings: net: ti,dp83867: add supply
 properties
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
Message-Id: <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2011;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=mjS6fhMb+ocKCpwPGoezcQxON+tek+N3jqUG0k3PUBM=;
 b=UsajLsR4goRt9vLB8c8weWLqISCqGRYgLriF+2Qva5JGkNQYR1Xf/cnWnH9z5/FOM8VStJqU4
 Q2P+2dmPjHaDuPD/KD+Wqbv3dmD1+74n+G6rHFACeaFivzupgQ24HDK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX6axcKtRYXIm9
 LKt4L5jod/ncJfTN/ysygq5VIGHUJ5C9TY5yG2rVXJc2yfXiVEC3yAu0d5dK9NdT/dSG1xLmaRv
 i0uNv6iaAiUqBRDJuwqbI3mR3EIx+e0=
X-Proofpoint-GUID: 8mrWK_og0Ce6j89etmLhwUyP-Z1SGuou
X-Proofpoint-ORIG-GUID: 8mrWK_og0Ce6j89etmLhwUyP-Z1SGuou
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc144b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX8ldz4NnIVLCq
 JWD1/p1z2nwR/xKj0v5w+JGs1sSaDAXknwxMsa5Uk4zUmJnf+N8ZfN6bVLj8+APLHQOI0Yo4Iz3
 z4MplWyZQkDkLae6H7QGsbEZlZTIMW9DuWk7gd7qj9Y9VtmL4hZy4uqNyElp4ubBRZi1bBGE1YA
 vWfo5HEnkVGj9qF2fOkbvIu6tffQW69b76Cko+VrA7Qw6esduF3lfCckuQHrdxk2DEOipHL7NZf
 2+3rrggKzdIEmFqNmwRyTTysDwBG4HvSLhhtQiaxgQBZnDA2wAwv7ActR8BDAoIoPcMpGYkBs5U
 uflT/ckifZvdqT+1jhX0zriiCArbfOVG/zUnaxYGq4/z7pJfjL8FRT3Kt4dr0eaJ058YzMNICws
 kzaLzryUm5IlSk6GtBf5jAsvIQS1vSdYfPBqRK2LHlEFWdld1b4uGWQdrzK5aRVPoyJHZEJkSN/
 SCniEclTpCVmtPVjJzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: This patch was accidentally dropped in v3. It has been re-added
as-is from v2.
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe..e78f08ded3d0 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1

