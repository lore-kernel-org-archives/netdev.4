Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998470;
	b=rYKoF3yoxcbC5qDg4WTvpUhlsMjKtzIhr0FO5ZhQi08LCmm6f0AGctArxAFxsq3g0x9J
	 qkVkaIttcFk4xCkous4DOzlykZcj9r5w/D8t0QeIf/oGu/Gmd0MCWvECohIXbWJZY74As
	 bpxlwu1kjMx1CSzk5qATFx9Cd09WLECw3Y+5DISYl7FrNNBv5Ju8tuUWKz0/SBJQeCXOA
	 aSP/DUPfJH7rg8jAlNjTLGN0kmsARD1dd3zyQtu6a56XZpqebDk8jAB316ObqPmdm1dr1
	 eK1XcKd27JN54Z4CbUMckqjrU8XhNhMhi7Zblui68JGPWZNstKRzLoqyeL4K8Xy9xfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
	b=QSxGzTHGuAJYBn+rY8Pb9NkVRokorAMUrtPRRmEvCEN43Qfoz8b05uMuiRqpXv5U67hx
	 B5hN5tm9XyGqqLrTqdMJiP/CCLf4YnLj3jyr7MhvHjzpO59tU7oNS6UTMHyhk9Uc68pUi
	 4wTyQK/YMDI767Yvac45tdj2iD0sGkYEOKalrpzwiPeLDvML+Tand3nnUYzhXOhiEGEh+
	 lxeFwTyDgpVao2q4fZXyb4QDcMexAB1gTO7HkDS35Yw6hTTffKJBQV3VdwY8ZU2UZCEbU
	 E1uQANiDVYrxrFI5m1o87iwZQ2f0KQBPU1qn+U1qGMeRUHSNpx1/0JbBu7nMUNfA63g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnc5VWIG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B06606A339
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B06606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnc5VWIG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so526848f8f.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998469; x=1795603269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=bnc5VWIG/OGvEIurIIk5O+jY0t7fEIqYGBB1T6BSBzhIjIzSJd3K+oMpEU0lbUXIGV
         REGw3J928rfq2I4FxTNt1lJQr1MGqKBF2KPSTCYeCEh+YSsPLJm5UxZeBJsfS205d+1A
         8sW266sPjbGpWyUSWgO0cGa4fElFgZ4+h2kgZDTAZLnr7KbdLWijbLdBKdsgPqDMNUUy
         qJJ9B7gPLeet5PdPt5vtG2Y8EtufGoxClj8jaqh8nPXlQ+9LtBUks5hFLP/6Bg7aEz40
         g7hcs3gHQNGt4V6nUmBHnkzTrSk9LjZPtePKjU0qfHBysojLhJfBRgB30+7sefzMbN94
         DShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998469; x=1795603269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=nd3gG9mL2SpsUsAZ4BY5wfFh7j7Jh3zujvWLhGAOVVV+u6rLTF21UoQfMvS598jtwt
         Ww5XD0/rJ2zbq7Dv828Z6eVWFVp9fxJD1L3lj2n/3p5vpXutauD3sqRGlLDmPNuC1l4K
         MWr53e8EijtBIV3qspLNCZm82EJRI2KaOiGi1AdDnuaFrz6V+hkPuS+IJHGFBb1WKY33
         y8SfET/7OI4DG80t2iA51G2ryOE+ag8RZJftg9lPittcF3RJMmM9SG+JtS/7l+DRfZ74
         tMFc5VYgOGFyuFYKqFnGFLuFUAXAqti65HeMG6s2jCBYTfuhboMUroM3aKsxyyE6gm4X
         mvrw==
X-Forwarded-Encrypted: i=1; AL+hErGC3m3Iw8/17YVk10yNh5VnujwePUVwkfJT9ZJ2fd//m2z7pscdEkAWkh3WYDwpD8CiNO9jCho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d+5MJMTb35p8h/V2BCJaPp6TCoosSuXbCPwNki468td3y5M+N
	CHXkF4UKVPQfsZg9QdfiicOfc1VhXAoWr6KCPIqo2hTkUA0Uv2O2V4iL
X-Gm-Gg: AZFdTZdJBm2iKkQ5yCccp7533Iz54u2sgW1SRui6jJikM1cOx7BR/IrcsH1IXO9iL0j
	dmLPQZRDaJMG08k4rZWdY8kLhGE1AIkJcXimW8i95Q7vQJAEXJ3Vla7zfO8V4rtMVNghBO+Kc7e
	sL8vULs+8GwDhm2DcwXyZJEIouxrR8+RsnFJ+HRKotAU2XWH5WFiFaJ8hvm2Jh8fJqmRIvSG5VG
	DEvj9xNPQYkkRlDJXfWSf+s0ENK1Bo7UGuY9xgvdmoVkFCRuBvJEyJXCIeq8wM1Q61ACHNgoEPx
	RTFmmQnDTGrS/IZdEp5quteXphQUDzEbeiq7NXhM/azS2vO8jl1SsSyN5PL39XZK80eZJLVoT1v
	TWxaIqHTgNGFhNBp1TGpQpR5EomXeRvb4eEjGYG5jkAOyOuF1YbHixlhQlYUys9LSa7VDjsSzXA
	4Gn8wvLu0erHUmtMMIlSdfsfVIhDnfVV8f6bWt0qNA10Ki8omwfuUXLiCjIwG/PK18DzNo6QC4S
	QWxBmXErNC4ByhJw3LvrTmdKlzyQUT9zHeBQj6qpeMsEcCacCtSsWkGNZDEUhtgkAcRpPaxw1mF
	elJ5kH1U8yflD1fq4DFpxbVY0DzX3/qnDPYtsENvExoGAffBogfj4yj3UrUGLWAhBtgKNgZhFX9
	MATSzwVdE0Bkklg==
X-Received: by 2002:a05:6000:454b:b0:4a4:f208:6a37 with SMTP id ffacd0b85a97d-4a63c55e023mr2812636f8f.42.1794998468511;
        Wed, 18 Nov 2026 02:41:08 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:08 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/4] net: dsa: qca8k: read each register into its own word over MDIO
Date: Wed, 18 Nov 2026 11:41:01 +0100
Message-ID: <20261118104104.26684-2-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

qca8k_bulk_read() is the regmap read op. When the Ethernet management
path is not available it falls back to reading the registers one by one
over MDIO, but it stores register i at val_buf + i with val_buf a void
pointer: the words land one byte apart and overwrite each other, and the
last six bytes of a three-register read are never written.

Every multi-register read over MDIO is garbage then. qca8k_fdb_read()
reads the three ATU registers this way, so the FDB dump shows MAC
addresses made of the VID and the aging field, the search reads a wrong
status and port mask for the entry it found, and qca8k_port_mdb_add()
and qca8k_port_mdb_del() write that port mask back into the ATU. With
tag_qca the management frames carry these reads and the fallback is
rarely taken; it is taken every time when the management conduit is
down, when a management read fails, and on boards whose CPU port is not
port 0, where qca8k_conduit_change() never sets up the management
conduit.

Store each register in its own u32.

The bug was found while bringing up a tagger without management frames;
an LLM assistant (Claude, claude-fable-5-1) helped write the fix and
this description. I reviewed both and tested the fix on a QCA8337 behind
an IPQ5018 (GL.iNet GL-B3000), where bridge fdb show returns the right
entries with it and garbage without.

Fixes: c766e077d927 ("net: dsa: qca8k: convert to regmap read/write API")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 382753bcc4..3c8044a4d1 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -519,7 +519,7 @@ qca8k_bulk_read(void *ctx, const void *reg_buf, size_t reg_len,
 
 	/* loop count times and increment reg of 4 */
 	for (i = 0; i < count; i++, reg += sizeof(u32)) {
-		ret = qca8k_read_mii(priv, reg, val_buf + i);
+		ret = qca8k_read_mii(priv, reg, (u32 *)val_buf + i);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.43.0

