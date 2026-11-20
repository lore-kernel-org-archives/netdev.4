Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146436;
	b=hYAQk4fx5lBV49o1d1rfBBRRfcf1DX5k8fctygTv9dEC2X8Ne0B00dNw615tddBLKNhW
	 zeQJyaszRiGnLxjnc8KhmrVf3MSBSlUWgxk45h6mNaAa8CqPmkFmCo/Zwc8smeNUQc8lG
	 el0A3ThPpUVvEPTzcYFqZfuPzeNuDpfLCGZUnWAHydTK7Gue2IDY9hknCTQr5eEjTzCGN
	 iaARjET9bNV3yGcclLkjk2qfuZ3IlxozWAxchILmZJYFkdDaU7JlFrhhDmwydglgOUtec
	 ZpBkjoB1i+FjSFHFEc8/qxhtqB1hixlkqZ/2ujMuqihxV38Ai1QNe+kksSacnz5cdZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
	b=mRwXpE6Pq4mZQcXMZSn6ohxRjoEbS0YoDkXJg0A7uOpKYuv6uGB9S+MKTwlmtCF7Jod5
	 MtaLPHvUADIBMd9XU3WU+g/hXnfJABuVS4mvpIgGbWv7W32Va3pbIz8W/HKpGs4+wqX5/
	 dgjuItoqrSkCIhV6NHCH/TiZu8jt/rEUCc1S076pvqLfw7NapzoeujZyUNn49oWsTJuG+
	 9wT8R4dVbV/kjDplCEu6X5S/2MLnQV2ctoKjXjAlp5G3U6000XZ9TOuDpF0PSyCUKJZ5B
	 vlOwYLCDE4oIt+IC5CWpXS8mjhjFMAC7q1HeP+MSZMuYQjF42oZs5Wa3EmAgmcSqVjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkkUn9It;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBD2606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBD2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkkUn9It
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04244c3d0so3603415ad.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146436; x=1795751236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=VkkUn9ItkidKYbXcfHSlfPBZudP9K2xImqcc9RRLJHf7WAOg6qYPjqgDmSdxSksIm5
         +OwMgPNqm/QwLeG8YjbbxUdXwf0xJRFWI/oeecvV1io7KyYaQgHIPFkZ1bU44YvykqtP
         oG+p7kWShpr0Tv3iHYxetTFDk1pkcBedBccFf94dCWx7GujcNp902VE/NmNK8rUHIVUr
         VoKwrnxzAYjddxn3hpqTSogjJV3jSCmAKS118ZasXUSQJlxJCyC5yqWnJj6tQ+7Mcpad
         pMyY+iom0k4upp3/oMlFrhp5AVzjtkELU2ceDglZ0kevpjn3UCpIqQiqFSXis09w3Dqh
         nnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146436; x=1795751236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=RluJH508JjOYBg2LWDQsEvkEetb9P6Hn79FbmttSI9CIjx8zPc08TTZvdObxLA57Gm
         do5QNh+YNSJwRgt1BE5hjeMlG+9GfZSFuVqkPaLsdXXiUVZ5qbbB/SPvbbva5BuirTZd
         789JrwT3u6bT42bVLfWn+0ytuWaT9GYSkQAgmXYj8QAp1s+2oqxJAWIoso7PKQNu6LYr
         7NjwBQ6ItHF5e1653y26R5riJw9DwMOwl+oQtuTj86mONBzznkp/Nkud38OS5nfFJ/tU
         2iO6dgWMhmz5ppts8WXOZuoG5bOU/IVCvuhDV9maX1xDll57h43PJ9Gt+PbhzzYE+J6Z
         o1lA==
X-Forwarded-Encrypted: i=1; AL+hErGn+A5nNfnEQq2YpxM2ThO+pwBmB14r/XJkj+PufWYgq4wbfVsKJmJromTbVsMwDZ6hw++rYyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aAEcy9Nstnylzx8LekF724Mn8DiD7zCeMfzPhVGMuT+FO44pH
	oMIlK1+uhslOR9ATyWMdqWUeRqaioe9e6W4urZlQSDPqL1iEx3B82FFLhEPkJxGr7A==
X-Gm-Gg: AZFdTZcZnunMqJbhQ9eV3iVtlFiCjh2/oZcTSwHpHGLsc0SlDgFNUv3OZuL7dP+dSt6
	tvr+6LH6F2aKY2x0oDEcPr/bIe5SB6KvaNawOMJkeiu2WvKz1wHGndvA9kf+uuOrsDMHjd29k41
	VyLCWogGxvjmgBR4S9Sri+0K/IOae2YXFpaHNK3p8hLiwubK/HE7qrWc29BrKAcSy77msPp2JMc
	XJyvueo7AO3tYivE2Ryfjcm6eDKufXRvTbTh36s6PBD1QyRZyUItPs0gsPm0D3jPoTqYPA7FLw/
	RaVeyFKJReDSILnSVIM9x3tZE/SIRDj9Z2W/w8p6JECrsaBrucmf6eAH6DzWkbDJ8jNSX18F0GQ
	CUFdFhvZqLaq1YW6OcTG+cUXppuyPxlR4+bo1NizR0rDUhejKB5aZWZOXcE+Vf2v/LA1MGvF2ML
	C23vksURghAihVaZ3/HY4PEHzIj1nc+dC/kASgq9YMeYlhTYa5sU1HIdHjlaiOlkzkZh2e6jRCT
	/V35FrJ+ooBhqvt6IJw/mefGPLSJazOeGN5xtVYf5x7ZdFO+y1o/mBOWH7WGHp8SF1upMkC3LW/
	NKI2HBhXZVpP1EMGmQbMR/icvrrrmTO/vCxeqgy460SYhrGO2FK0jd56qfqerVS0CIrZxfTpuJL
	7WQh7A5d3CObW5u71
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr1557473a91.52.1795146435786;
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Fri, 20 Nov 2026 10:47:00 +0700
Message-ID: <753a575720fa88245d12b19081741687271f6c2c.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795143925.git.jjc@jclark.com>
References: <cover.1795143925.git.jjc@jclark.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0

