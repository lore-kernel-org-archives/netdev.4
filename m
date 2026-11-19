Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095676;
	b=v9R/C65ThIZNFt+X0bCkOv0Hs85K+XeIhf/+yECAjBcG7/TgJ5CSSkd2StdVroRX5cXc
	 +pF1dYmFs1jUmMA0O1k8K52YZ0PY8VdRQGuHMTIjf7kPx1X5htW7AXHrECP/yYaospFuW
	 Qdg7Y0+emkfBa51XltrEWFm0VwgIYi0ufQ0KlyxXcS5QdcYWoSVOB4845WGEY1gnC34eb
	 Gy8+b7mtymc7E8NYSEq/OwIbfHzR8RamPt923WwYgks/D6N5lpb3RbRzYKlOFZ9EzZAXU
	 MHa0UxRHkVbw6l0MD3yCUvTtU9JmlZQQt6XEQLBW6wHKZH3/lpKFieQZFp4sAOsCWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
	b=whc+1GroOIPBSOmzAkAJdZgB9mpIkDdGDWW1ccGBGjoF7xy7YW5PKsoSSwAygUqsbVOQ
	 /RmuCeZRH7Jc/Dwi1ogrCTHR6hJ3w5/ipXz1MLKqtWCo3gIQXKEIt8vqTJ4hXWf5Ixd/s
	 TaISz51ejgEKNk5xiiTwi1e2fv0kdbiFLoGj3HuGlTIcN6csWgaGTyhtH3Rq/vfQ65KvR
	 XrjAmsyukFHsDBKYR1GmC0BZc2mzzaW/fD2kFUhkSnQ5vdpw4axHyWWmaomgYzy8/tV/G
	 qsV7DmE4bZu7XeDNG9s7t6MYgWW1WLlqL611dBcsP07Y8P+1k+gU7zQjBIj/twA46AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjqZuHaz;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BEE606A33B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BEE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjqZuHaz
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so3079922a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095674; x=1795700474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=VjqZuHazwHa66f0MNLWNqb6jSuUcQZOv/SbwTxXT6qA7BpYarCSE9mGZtAjOUoqLE/
         8ljuOEiPiQJp3NUgZf25sUbDgBpJ1HZ3C84RU07RDN2Gw1pHcAViGLZs+DZkBKAh0htm
         kinVWqZF44RXd8AwbTOeZcAc+i4/vizf0yGm56dYvUiKNPccAIPfQz9igIHCASyw3a5d
         n7mMT8y1NDhfhPHvQsxEGEFucQ5lDyES/VTp2gZ4dfFbPnnKHr0s9WeJriDkA9uaIRv9
         x6knmxHX2aATTvPwoTASKT2Co13ZIqCwnCl1UOyl2lrSTo8DXcJrjgLb7UZw3DCJj/fW
         8Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095674; x=1795700474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=a976bY8CDA5VTv+XP6Iit3Pis0140jLHsAnRepReVR3KkxRwR+w0igxjZcgmWR3FgH
         N+db0VqlZLCrgRyRb9zPDnbtQSDl0A6N50JlAto/lJ/8HeuNLH8vCL26NQCFMVRvISrg
         EJ4EUjXudHX+hmQLc1SiiHHy1Eu9eb7vSxwFYZvj/ip5uUYsUcUJWnqcOfckKbZtOsOr
         j0vBCg0No7wwu23MqJK7/ea9nESxVKZq7GA+S+xEG7EQnDk9lW8HidIy89e4v9BO2pV7
         /8s6GKnnxKlrk3hphuA8AR739EIE/CpploLOljYqosTeRL6zA6Y+fscrwdmXU5k9j5Nb
         HIgg==
X-Forwarded-Encrypted: i=1; AL+hErF/4+lgIOqglJv3Hkcdcu4I/ksgv30yE4KDKTDzZ3dqkDFBRQsFB9JpQni6jps5IfM6yloSuWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CYolxlA8jiiMXuZqrFE0dlHgY1t/owlGmLxjsAnQL6ffd36AW
	LtGn/UzabQif7xkwPFjjMlxQpISZvSYGmpq0pJDsKO7mKqQIqmFPHeOQ
X-Gm-Gg: AYBFou3G4NCjEsbhEqM5ejPq7tOPivRZOH1gyTQ8St5aG6aMbPAxr1QGQxZ9qy7iPCf
	+jh07SsJwWERZEctdRSCTAaGKmx/5CZCqlYRJyILQveT1V9YPcPehAg0zIKDihuXqkp1FR/ikeP
	OwjRmwHWucjW9sFOQOjvCLnANhMk9rmysNIVes71v7SvfkElhfBFn7m8uLk07QJFtrQgL7QWQor
	3oo/0wSZM6Xw3BiQNqcsqwRtK8PDtjzsUSiJSjPIZCWc+kXvofIV96uFxJoXAz3Hyyw/4+gOlPp
	eWI7QDQvkQ9mwmHzA/KXV3x2RnSiQwbB3QRMljmmMEFwosYOtDiDVwc+fB6phL4W5M6rMuJeGes
	IeBsd/Qcr9rInpg5hMjtv+iw4LmrEy1QPlpKSESnbNCnYAkrL0BGBoFXKLOhWHtA6raVdA9Nwsi
	I9O9EyEpRa9r9JShpR1BcaT8VYSzQxf9QwRwsrCyXbqrJlSfpqUsc0HdIraMNMGoAhIbYCeVE9b
	TYcmboA3nLNvo67EnkqEWld168ymrXI1DeSSaYT6Abo2dz0BWRKa6FgMIyKme9jbYlVtyTGlzEZ
	OONKrPKSS40+FLYz8cOvagggQnZKpwedmy8rle4loWEttTeOAx2vb0BauVKBlLRWSgTB5YE4IqL
	jOE85wzYC2l5yFj5YTzSLEzfLWGmkbjNsiPY=
X-Received: by 2002:a17:907:ea8e:b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c510debe78amr570893666b.1.1795095674419;
        Thu, 19 Nov 2026 05:41:14 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
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
Subject: [PATCH net-next v4 1/4] net: dsa: qca8k: read each register into its own word over MDIO
Date: Thu, 19 Nov 2026 14:41:07 +0100
Message-ID: <20261119134110.15048-2-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
References: <20261119134110.15048-1-kuncy7@gmail.com>
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

