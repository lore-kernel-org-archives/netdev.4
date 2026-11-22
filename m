Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363767;
	b=Muk4g1Z1aYkwpkLu1Gg+If+rO5T8XJi3pniXpWtkJlWzgkjhkW71XDBQKyBdk3eLK3bd
	 AnTNQKf3WoEcuUuuTkXVW2HyRPHbjunpknQWDT3F/k+ioL3/gFipZouzDRfSQoz9bFMJ2
	 8PvExfdzOO3TudpuN+5p+PvSGItyss4sf3r1gK2ORr40sgrEU8oFtHrgP8HjmDnYFFRyZ
	 /GD9qMKZbC6aoiW5HU04WRJL6l3+bPHjIOXTnU9iGSH8RfSz7HqC5J7QOWWuhbarpcGyO
	 +LuB/ysOAD6IIgV5TSJCp2jb+yKItg8j/P25ynGF4RN1Zej3UPdE/oG61mGeCN8UpLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
	b=wGAAEazVUGM8dGnmmyTy8ekakboEQOj8TiwPaCyB746utIxcBfsPwajoJ35ySJg3Erjr
	 sOjqrjZuCLYcFFUQat4CEiMr/0FtIWuGtlqHtc+t2spr6qN80fMDf8f2GGAm3XxYUKULN
	 IXyZSg8VCKLcpc5vBzbkucROiUcqiqm61BHYzmNakaLrsbprOAO3ArQsiNXaY0VC4x0vO
	 oyNSeNxWYtjtLdH7oaBugOr6e2xIZnig0VEFrzM61bjxSEyIX0JX9i0YiKeJgDd3zSZTK
	 zAmUVPXpJnWUZ00Jl/Vs1aeu827LHDjoA0t3oc9+Tzl3MNioDcMtxK3eWlplEuAKXlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ohn6LKTA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20140606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20140606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ohn6LKTA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRROo1250089
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dyOk/+hQC3d
	S2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=; b=fo11p71ugXj+px95KD0I3tYDbTh
	yS9cS8ycCi2GiMgJ1j8GedN7CBzMcbpWS4qXCxe2NuSKyGHBARcGIzocsdXToWVK
	y1bcpA4Oc+uIVfCp5gmY4cRwXXK5FO1izXGR5WE+KUAnxFEdgYpa4D2VzoemGPUx
	9QP3WefnhdCgec0yiiuJ82z0On3b11VWyTGY2JB89i0LnBcr1Wc/IjF+CXBN3Pq1
	jlNK9H+2KMoKbuQVcYjXnaIFiIDh21fggm42Y5o87jwDTYfvqiSgdNMMEwexXVwM
	htEp6POXtjAeln8wZE5NSqMceJ+3UgJjSlAUFW1XroSL2K/pTQ4etxW7wqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so842875885a.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363765; x=1795968565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=Ohn6LKTA6BqWlHHewDtQ7Op8x6hmRoFhaIJODQDqQFArqnHYvGawbPNDi1hz6uIWEp
         Z8V3Khewvqt5f1RJH4x83wTe97tjMNhutdFvXV/l/oVh+AM16Nx0lSk35BOVGhBZ9c0/
         OwOYYxy+HHy7EB8utYXheQBKuNb0FfBTNbHKSs9jLHXux4+F5GIrHP+vW0IBr79wjvSe
         wWJi2JsVkchgRhRpj5SfgiJ+raLyrgIubu+aDtbmgRx1iG8q0rnFPCv90Tcghy/pC9jk
         EoBdxMqx0Gd5evRWmtwTF+DKMcxge5cqkMn/TSzCcFc81/D5nLJIKUsbbq8b5Zc4pSq8
         QYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363765; x=1795968565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=seHFaiBPROwJ5zALadhWjUUm0kyfOibAS9hO0A5BgltYzqV85YWfjxfNnR+QYV4PRZ
         99ecUL8TSHuHzRgw5nK921jdLwg6CJ/zU1fyXj0wMrcrIWEPYmmMdOHQvbJgFM8XgN/J
         d7SyWrDhB5JBfnOCB9i/lZRjTIRqsitJwyELWK+XmcFEyu3PyZmJcuW7vrqPGiqf7uhZ
         pMrUHGJfbdR3ngRvzkkVdEYQPx7+4J8vzxofsTf03qGLE6+jWcG33la0bvTBGThnv//V
         N+Jasx0sJMwK5zOooAK+2Dx7wxb2aBLCmZ5tvCFQ/855nMyDixLJo4JlS7+foOghl3/O
         ISbw==
X-Forwarded-Encrypted: i=1; AL+hErGtNwxIo1vMoQH/YAQAqTw6lQrazm/4/kCHfei4N6Dg/+ORAxq1H9MLSIwEgc3Stmgqvr97nVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Umk85sLsJxjb2Mm+A51H1LLvXlYS8V8dDHaxi15bm4Ha/ylZw
	25DqpUX3zr3yeAx91AQgH3H0Zu4OeZAFNHxdWu+nwx20jt+V+M1QeWFktCGVM5LyPMkkXLyoGhJ
	7b1sXYfko9HXNK1lOyoDpYqZsDrwwYPQAcC+IZGAeN4qld+6WjdNn0Sh5/dM=
X-Gm-Gg: AZFdTZfMZlCj9nFRgisK+FQPCrirBwA2cUPySho1y1rQPCb5M0lsWz3BaknhFjF/Fof
	mlawfvUIPiXyqva1OfHTl2SGd77v4VRUB41Id8plwdbmxmrbJaC1cQU3Opt9YdMBl3dAcpsmdR2
	27W1G1WvQPiv5N6snQtOX1NzfqXxVvBlgj78rUg++TIkoMCoSOCWseRBZyOVTy6lBYyc1PiSrgl
	Qmj0U8KrxrmdwqhGLeWSZq1quEf/db1lA+pYP2zkBeynv/QEn760dtjevwy73NsiR3jp/EeT3Rz
	SlHcqhcYkD+OzKcYnXE+0YCL3ruUsVpJL7lHJuw6+hjRQzpR1o59ej+HBMbto6nNMs71/XEO/tS
	bmE3C2X9XpdKukw07x1ze4gWNYir2CS6O+jHasRIf3EGKXEsqecqP/gE6SXvilg==
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661820385a.1.1795363765095;
        Sun, 22 Nov 2026 08:09:25 -0800 (PST)
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661816685a.1.1795363764668;
        Sun, 22 Nov 2026 08:09:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:23 -0800 (PST)
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
Subject: [PATCH net-next 2/2] dt-bindings: net: dsa: Flag unexpected ethernet ports
Date: Sun, 22 Nov 2026 17:09:09 +0100
Message-ID: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6422; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=reMATxFxVxRB+raQ83jYfeaAK2V6mtUNc6Wp2ta7pEM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOkOJWDsz07omJXLZhaMWPp6woHPL8+pCClu
 +kZC4bdMluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTpAAKCRDBN2bmhouD
 1xQIEACaFedbtKzfFmbnBJcFU8CEz4FyuAcxxPgxdFqxRqpIg1xHeRGybC4E37WJVdFmDXL+IiM
 FZdr8VzQM8M2DA6tywEWp/eKIa0cZKVKpdARltyyNDRG/YtWqJgjc5BMnYxsVAqb7Vo6kjQr5Vm
 9nVSouM8M+29Ue122ZMOG4/rUOQog384qunka/dtrk8IysLT+e6UvBvHLsiPuA95hYzqS9KOVzL
 3VHZybyVb6e2m2Y/r7XzFzlhR5H0EDq7gJ5NJy8MOG15tAcJ+TU3plPFRbtBjkSOB7i8Ubysvhr
 xUQCrae3P5pSL4fWowBqQNdGvP3fPkhgA+w5tyOvHSAdCed5brmxQdvHogqCW4+KCWT+PWfpMQH
 R7E1iMnrzjWZp2X9SbexuwXUPfw2orGQ5jZJslTL6ODd8dCeVJ/YuYRvCAVsGKviS5w5MsmZY3z
 r5KeZ3KftGG2iI7ViBELF45gUtCNed55Qf+zyf4tmwZzBmPz7BisgagXHW2QHhCdw/R6L3sid4m
 HnJPr8+IH6gyV7s8rtUJVLJImgJ495iS9vziAi328myZSRS3NjFllSR3IYkdwjgnXOHgWtYTbau
 4GUlpviCm+QmtNUAHyKzm7LGUNZsQzrtIigRBlx2oqktTVRCSLB7mGcLj6/GlI8SrWpa+q7CJCW LmkHerMGT7PwnEg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwvOY1RMsHopa
 kOGbliHSp5cbIpIFSNfdGGKIU+p8FU8o2hUp74XG1D2SajIdlMT7q+Y5N8WwKMLWmoWTiV5qDMw
 rxffReAX5ZwAqamLVxl7vndJBL4MvwP/pJOhYgth4TA+Dj5iiiNCYv3I8f2XVYT36ZRhnlLi8om
 WccYewAqKie2tXptYVeZGKqtL1HpxLaIz9QjwoBVSwT5hGfhunMrQWCZahXdSUejF3o4X5oTRff
 MDVIqsaIKgO47LRGoSldw+nh7iKZmmgOaGgsy9k8fnBluFEvh3yJZS4TXg5t5tP5HBy6cI19ert
 DyiJupFoRFsIMIisbX6aRWtwSAj2oPkabmF76Hnz1qGLz/48bsaee22MFyMlH7TvQeAIPtWPzTH
 6pA03YugCMwKhFCh/+3WcTUggnRRi14Bu6KNu1DWm13DCUhQYrvHQnpippZLceWEUFFG97Y7MPR
 tlmqxDjqJs4ZsThN32A==
X-Proofpoint-ORIG-GUID: txjoczAaUqk-mQeuyJUt9cJpYgIMjHNo
X-Proofpoint-GUID: txjoczAaUqk-mQeuyJUt9cJpYgIMjHNo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX606pdA5tlw57
 0xAYhQ922HLsicETYFRJ6Zv1n7c2X/UbwBFXsQPYrQxkER+Ge/IR5jK76+2O0DVxos2anrz57T0
 q386jcfnkPyw6o0kci1LU7sNLwGO8U8=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b0313b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DPh3dRPQxyF78rqZMbEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Bindings which reference dsa.yaml ports and restrict their own
ports to specific subset (e.g. with pattern "^(ethernet-)?port@[0-6]$")
actually silently allow ports with any unit address, because they use
"additionalProperties: true".  These additional ports are incorrect and
should be flagged by the schema.  Solve this by dropping the unit
address from the pattern completely and adding proper constrain on the
'reg' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/dsa/lantiq,gswip.yaml        | 4 +++-
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 +++++----
 .../devicetree/bindings/net/dsa/microchip,ksz.yaml       | 4 +++-
 .../devicetree/bindings/net/dsa/microchip,lan937x.yaml   | 7 ++++++-
 .../bindings/net/dsa/microchip,lan96455s-switch.yaml     | 6 +++++-
 Documentation/devicetree/bindings/net/dsa/qca8k.yaml     | 4 +++-
 6 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
index 89f78a1bc113..83cdd6c80d09 100644
--- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
@@ -108,13 +108,15 @@ patternProperties:
   "^(ethernet-)?ports$":
     type: object
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         $ref: dsa-port.yaml#
         allOf:
           - $ref: /schemas/phy/phy-common-props.yaml#
         unevaluatedProperties: false
 
         properties:
+          reg:
+            maximum: 6
           maxlinear,slew-rate-txc:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..80cda7ec5cb6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -179,12 +179,13 @@ patternProperties:
     additionalProperties: true
 
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
 
         properties:
           reg:
+            maximum: 6
             description:
               Port address described must be 5 or 6 for CPU port and from 0 to 5
               for user ports.
@@ -208,7 +209,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -220,7 +221,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -246,7 +247,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 4ed13870ed3a..9cc14aa7b4b1 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -129,10 +129,12 @@ allOf:
       patternProperties:
         "^(ethernet-)?ports$":
           patternProperties:
-            "^(ethernet-)?port@[0-2]$":
+            "^(ethernet-)?port@":
               $ref: dsa-port.yaml#
               unevaluatedProperties: false
               properties:
+                reg:
+                  maximum: 2
                 microchip,rmii-clk-internal:
                   $ref: /schemas/types.yaml#/definitions/flag
                   description:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 9973d64f15a7..36a7c81df747 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -39,7 +39,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-7]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 7
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
index 517bc4c00de3..17e3c00f5a32 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
@@ -105,11 +105,15 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-8]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
         additionalProperties: true
 
+        properties:
+          reg:
+            maximum: 8
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
index 167398ab253a..3840b336bdb9 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
@@ -75,13 +75,15 @@ patternProperties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
 
         $ref: dsa-port.yaml#
 
         properties:
+          reg:
+            maximum: 6
           qca,sgmii-rxclk-falling-edge:
             $ref: /schemas/types.yaml#/definitions/flag
             description:
-- 
2.53.0

