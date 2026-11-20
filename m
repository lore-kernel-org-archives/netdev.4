Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134368;
	b=eHvJK6Kh69MbApLKPJf+MCMHItog2nHjwHI+6J0IYl+PqZGqbAJtlksICSaQTkuZIMF/
	 YL/xA7vt9gXtKm6O7IIJzkEYxdOVvLn+L5W1zK68S3waNaNrtVcQOp6uNssGt2DfDITLv
	 1kr4ZOzHpFC6CpWHHCFRDihicYnJS2HjmsHPGblqe6/gq8o2sEwMk+cV8CRho/BIop77d
	 LFjw3M9p41Omx51xTsbOi/UDJ7z6dx3Xxm1LXLb4hiQmjPtKAdY/daJOCHFpluTXziboZ
	 CXM+ejWs2G3XKPufhuwzm0RIEyHQkWbDb5WU7cZjkcE8fhqGwL/xbrSHPMb+64rIRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
	b=BKccb1aCJzWLEf+ft3rPu/pEiGB/YTbTJ3XJg+LQsaxAYncu09LJ/3E1+FKHR9PIor67
	 vukyAElxcSniYU21m3gss7VR6SEkooDjbI6aqOjcxhWz6z5kCXnM0yqjqxPlSqGV3SJSD
	 rbsIKqthJ2+aA9KD7V//sHgHRLZY192XzHIQBtTfWpqEYzHIMvrq0DgsZVVHg699ZeZQe
	 kh+g2CXeNuanHlgD6RXrQ+dMvMX4FG4RIV3d8JxvKI/z5hnBmePzIz7fmxUTDdWuN4ZXe
	 Ewj2ni7uUHycR7pRuDLJD/DN6J9aCSYXwZ1pmkMPCNxNhYMQjV3O4ma/lsj/+iBoo5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFR4Urhh;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF160A5BD2
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AF160A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFR4Urhh
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1056102f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134366; x=1795739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
        b=hFR4Urhhy5pynmaEn2XSWln1vfQRlQu3rV95ts7/CSzJHMgltu1s5vMK+GlZFtabnL
         uhEcjM1QoN+HW0NKsZxsJfRpPZFJDUgxZhvCw+mYjKBvEIThRt1KOCbN8txky8IUY+d6
         FJ8p1o3z0gp6qxxOZaRt+DWG11k1VrjQEvphx1igmfwBtK/YOagfh6f46fS7XZmi7Svl
         fU1wIXA/1jJ0WU3VSfIqYvEoLH7gJivUCtpwgiKtcLPzPjBHaZm3MHw4RU4ZpkFFA9o+
         1F1P/oAX9LdxiPLgAivCuOg9Js3YxNRAhBngMqEKisrmCXCwUbNw6g/dmulcZIoMS8wO
         vMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134366; x=1795739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
        b=SPlpx6TgHj50mmwzZQOW9M42B/YCjt4XTKhIr+NG4oHoHoPuYWjU7HK5ndASvk/kkC
         ll8ugNnC+tXBFpOH5Ymah9ak9usEO/y5Fpg7owBUa93W3VCFuqS8XY5P6fvsWL6Zx9eM
         Z/GCRe4k4fHoxyB4M9aW/PqUqL7EQr6zSxt1vzlXEkWI7wz1Ke+wH1EUDUJutEt+IoaJ
         HMJSm+IA0TUJoAX5NG22m+cxtTL3N3BS3dxQj+EOa0Rd/jhbcMkWFgiaP1QRR7/6XgUN
         EOiYf2W01MibiVYxd0PLruyKSTo6i/2cygahimRpBgJgp8i7j9cQroRpsobQ6b2BX0Id
         0bvA==
X-Forwarded-Encrypted: i=1; AL+hErH/3d/kb0n78faNIs+0ljbm1YtjH4qFyzk0p5bpJXebgmDmERYGid/tmWSr1n/MEkGu7SS9Uqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2dlIBqHSCU7he5HamYtnwqeEAfbGlLt6yMwn/q0sPVWs0Btu8
	vW60m2+/JIRSWeodKwcHotUcrZt89K8uqCDLWRQ0Pq1yCSiM1kIG40Ln
X-Gm-Gg: AZFdTZeY8RIwtD4W0+M6ObtRvfkshOq7SSswLskxpikM6E5DQfMQYuLAjB4VeQdWPTI
	r1/hJDHFugGEx5XliCJCnOD6PUSkeMC6uOI9JRPVYLbRoLwuiSxgQL1RJVupDlitz+dgq2I1CWO
	a6WAyLU3gIql3ilKBxn9Q1p4fBP8yDZ9zzpj8HIshcIzbDh9Gse3/+FqP44NTznzBmzysiDDLXO
	3RZAJ5gM04Ky3R+TSRnKOclDw4k3TK2HF4tvAOiE9ZTHfoFdbPF+PhAjO8JiH9L7eXonwit0Ld+
	My/fbZcN1wrLhPTTP2ckhCOwp5kixbdXMRBQQizHKEXvR055garxA015nxu7CoTQ8ShPAj38OhL
	3VUku8DtKXjgLepPzlqxwvDyQZ8kmKlF99XAd1C+Ghh61jgq2A7dmRa4lMLErfDyPH0P3P4v27p
	F9ZDLIZpSaI//i4xUTc0tj6xsL2t7BaMEpuVJBz5h/GUkl6cA1JHgC5UgzdiAsc6DvXJssEBDDb
	/q6oJVp7ZmCDpnIEcOxzbOAEGzlYoqRsaZ+boUpxOxT+GCDzQW75mmr/JnricvxUPehyYh8j6+Z
	kjTuT532bpcXa5WezQ+gp3yblDjzyQkHTqkevSWmkWurDznK6RjRWeT0qNq3CBxsAD9SyR1Xp+V
	OPDp6Z60tE88eaNG9IlGt9a7AU+IEXHy5HK+R3bVZWyifhgFpux74CrMdTXoozw/dk1CPNRoLhO
	8KNGKC7H78wQsOCnerNw==
X-Received: by 2002:a5d:5f08:0:b0:4a7:1428:13f5 with SMTP id ffacd0b85a97d-4abb2448700mr2097188f8f.14.1795134366161;
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 13/24] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Fri, 20 Nov 2026 00:25:23 +0000
Message-ID: <20261120002549.1908299-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 669dc584e6f7..4b31a1d331e1 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1217,6 +1217,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc_obj(dev, *a5psw);
@@ -1251,6 +1252,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.56.1

